{
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;
  programs.wlogout = {
    enable = true;

    # The layout file: each entry corresponds to a button
    layout = [
      {
        label = "lock";
        action = "hyprlock"; # replace with your locker
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Sleep";
        keybind = "s";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "p";
      }
    ];

    # CSS theme for wlogout
    style = ''
      @import "../../.config/waybar/themes/matugen-waybar.css";
    '';
  };
}
