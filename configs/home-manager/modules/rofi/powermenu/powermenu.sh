#!/usr/bin/env bash
set -euo pipefail

# Current Theme
dir="$HOME/.config/rofi/themes"
theme='powermenu'

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"
host="$(hostname)"

# Options
shutdown='⏻ Shutdown'
reboot=' Reboot'
lock=' Lock'
suspend=' Suspend'
logout='󰍃 Logout'
yes=' Yes'
no=' No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Uptime: $uptime" \
		-theme "${dir}/${theme}.rasi" \
		-kb-custom-1 'p' \
		-kb-custom-2 'r' \
		-kb-custom-3 's' \
		-kb-custom-4 'l'
	# p = poweroff, r = reboot, s = suspend, l = logout
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme "${dir}/${theme}.rasi"
}

confirm_exit() { printf '%s\n%s\n' "$yes" "$no" | confirm_cmd; }

run_rofi() {
	printf '%s\n%s\n%s\n%s\n%s\n' \
		"$lock" "$suspend" "$logout" "$reboot" "$shutdown" | rofi_cmd
	return $?
}

# ---- Wayland-friendly logout detection/dispatch ----
logout_cmd() {
	# Hyprland
	if [[ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]] || command -v hyprctl >/dev/null 2>&1; then
		hyprctl dispatch exit
		return
	fi

	# Sway (and most wlroots sway-compatible setups)
	if [[ -n "${SWAYSOCK:-}" ]] || command -v swaymsg >/dev/null 2>&1; then
		swaymsg exit
		return
	fi

	# Niri
	if command -v niri >/dev/null 2>&1; then
		# niri's IPC subcommand:
		niri msg exit
		return
	fi

	# Fallbacks (X11/others)
	if [[ "${DESKTOP_SESSION:-}" == "openbox" ]] && command -v openbox >/dev/null 2>&1; then
		openbox --exit; return
	elif [[ "${DESKTOP_SESSION:-}" == "bspwm" ]] && command -v bspc >/dev/null 2>&1; then
		bspc quit; return
	elif [[ "${DESKTOP_SESSION:-}" == "i3" ]] && command -v i3-msg >/dev/null 2>&1; then
		i3-msg exit; return
	elif [[ "${DESKTOP_SESSION:-}" == "plasma" ]] && command -v qdbus >/dev/null 2>&1; then
		qdbus org.kde.ksmserver /KSMServer logout 0 0 0; return
	fi

	rofi -e "Logout not supported: couldn't detect compositor/session."
}

# Execute Command (with confirmation)
run_cmd() {
	local selected
	selected="$(confirm_exit)"
	if [[ "$selected" != "$yes" ]]; then
		exit 0
	fi

	case "${1:-}" in
		--shutdown)
			systemctl poweroff
			;;
		--reboot)
			systemctl reboot
			;;
		--suspend)
			mpc -q pause 2>/dev/null || true
			amixer set Master mute 2>/dev/null || true
			systemctl suspend
			;;
		--logout)
			logout_cmd
			;;
	esac
}

# Actions
chosen="$(run_rofi)"
rofi_exit=$?

# Handle custom keybindings:
#   custom-1 -> exit code 10
#   custom-2 -> 11
#   custom-3 -> 12
#   custom-4 -> 13
case "$rofi_exit" in
	10) run_cmd --shutdown; exit 0 ;;
	11) run_cmd --reboot;   exit 0 ;;
	12) run_cmd --suspend;  exit 0 ;;
	13) run_cmd --logout;   exit 0 ;;
esac

# Normal selection (Enter / mouse)
case "$chosen" in
	"$shutdown") run_cmd --shutdown ;;
	"$reboot")   run_cmd --reboot ;;
	"$lock")
		# Wayland-friendly lock options first (if you have them)
		if command -v swaylock >/dev/null 2>&1; then
			swaylock
		elif [[ -x '/usr/bin/betterlockscreen' ]]; then
			betterlockscreen -l
		elif [[ -x '/usr/bin/i3lock' ]]; then
			i3lock
		else
			rofi -e "No lock program found (try swaylock)."
		fi
		;;
	"$suspend")  run_cmd --suspend ;;
	"$logout")   run_cmd --logout ;;
esac
