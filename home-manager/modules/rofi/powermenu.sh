#!/usr/bin/env bash
set -euo pipefail

theme="${XDG_CONFIG_HOME:-$HOME/.config}/rofi/theme.rasi"
uptime="$(uptime -p 2>/dev/null | sed 's/^up //')"

# Nice-looking labels (need a Nerd Font). Replace with plain text if you prefer.
opt_lock="  Lock"
opt_suspend="  Suspend"
opt_logout="󰗼  Logout"
opt_reboot="󰜉  Reboot"
opt_poweroff="  Shutdown"

menu() {
  printf '%s\n' \
    "$opt_lock" "$opt_suspend" "$opt_logout" "$opt_reboot" "$opt_poweroff" |
    rofi -dmenu -i -p "power  ⏱ ${uptime:-}" -theme "$theme"
}

confirm() {
  local prompt="$1"
  local ans
  ans="$(printf 'No\nYes' | rofi -dmenu -i -p "$prompt" -theme "$theme" || true)"
  [ "$ans" = "Yes" ]
}

lock_screen() {
  if command -v hyprlock >/dev/null; then
    hyprlock
  elif command -v swaylock >/dev/null; then
    swaylock -f
  elif command -v i3lock >/dev/null; then
    i3lock
  elif command -v loginctl >/dev/null; then
    loginctl lock-session "${XDG_SESSION_ID:-self}"
  fi
}

logout_session() {
  if command -v hyprctl >/dev/null; then
    hyprctl dispatch exit
  elif [ -n "${SWAYSOCK-}" ] || command -v swaymsg >/dev/null; then
    swaymsg exit
  elif command -v i3-msg >/dev/null; then
    i3-msg exit
  elif command -v loginctl >/dev/null; then
    loginctl terminate-user "$USER"
  fi
}

choice="$(menu || true)"
case "${choice:-}" in
"$opt_lock") lock_screen ;;
"$opt_suspend") confirm "Suspend?" && systemctl suspend ;;
"$opt_logout") confirm "Logout?" && logout_session ;;
"$opt_reboot") confirm "Reboot?" && systemctl reboot ;;
"$opt_poweroff") confirm "Shutdown?" && systemctl poweroff ;;
*) exit 0 ;;
esac
