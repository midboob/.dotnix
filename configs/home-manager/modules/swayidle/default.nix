{ pkgs, ... }:

let
  lockAndDpmsOff = pkgs.writeShellScript "lock-and-dpms-off" ''
    #!/usr/bin/env sh
    set -e

    case "$XDG_CURRENT_DESKTOP" in
      Hyprland)
        ${pkgs.hyprlock}/bin/hyprlock
        ${pkgs.hyprland}/bin/hyprctl dispatch dpms off
        ;;
      sway)
        ${pkgs.swaylock}/bin/swaylock -f
        ${pkgs.sway}/bin/swaymsg "output * power off"
        ;;
      niri)
        ${pkgs.swaylock}/bin/swaylock -f
        ${pkgs.niri}/bin/niri msg action power-off-monitors
        ;;
      *)
        echo "Unknown compositor: $XDG_CURRENT_DESKTOP" >&2
        ;;
    esac
  '';

  dpmsOn = pkgs.writeShellScript "dpms-on" ''
    #!/usr/bin/env sh
    set -e

    case "$XDG_CURRENT_DESKTOP" in
      Hyprland)
        ${pkgs.hyprland}/bin/hyprctl dispatch dpms on
        ;;
      sway)
        ${pkgs.sway}/bin/swaymsg "output * power on"
        ;;
      niri)
        ${pkgs.niri}/bin/niri msg action power-on-monitors
        ;;
    esac
  '';
in
{
  home.packages = with pkgs; [
    swayidle
    swaylock
    hyprlock
  ];

  services.swayidle = {
    enable = true;

    timeouts = [
      {
        timeout = 300; # 5 min
        command = "${lockAndDpmsOff}";
        resumeCommand = "${dpmsOn}";
      }
      {
        timeout = 900; # 15 min
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];

    events = {
      before-sleep = "${lockAndDpmsOff}";
    };
  };
}
