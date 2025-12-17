#!/usr/bin/env bash

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

# Ask for confirmation
confirm_exit() {
	printf '%s\n%s\n' "$yes" "$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	printf '%s\n%s\n%s\n%s\n%s\n' \
		"$lock" "$suspend" "$logout" "$reboot" "$shutdown" | rofi_cmd
	return $?
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			mpc -q pause 2>/dev/null || true
			amixer set Master mute 2>/dev/null || true
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
			if   [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
				i3-msg exit
			elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
				qdbus org.kde.ksmserver /KSMServer logout 0 0 0
			fi
		fi
	else
		exit 0
	fi
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
	"$shutdown")
		run_cmd --shutdown
		;;
	"$reboot")
		run_cmd --reboot
		;;
	"$lock")
		if [[ -x '/usr/bin/betterlockscreen' ]]; then
			betterlockscreen -l
		elif [[ -x '/usr/bin/i3lock' ]]; then
			i3lock
		fi
		;;
	"$suspend")
		run_cmd --suspend
		;;
	"$logout")
		run_cmd --logout
		;;
esac
