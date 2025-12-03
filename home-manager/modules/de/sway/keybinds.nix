{
  pkgs,
  config,
  lib,
  ...
}: {
  wayland.windowManager.sway.config = {
    modifier = "Mod4";
    terminal = "${pkgs.foot}/bin/foot";
    menu = "${pkgs.rofi}/bin/rofi -show drun";

    floating.modifier = "Mod4";

    # mousebindings = {
    #   "Mod4+button1" = "move";
    #   "Mod4+button3" = "resize";
    # };
    #
    keybindings = {
      # Basic
      "Mod4+Q" = "kill";
      "Mod4+V" = "floating toggle";
      "Mod4+F" = "fullscreen toggle";

      # Apps
      "Mod4+Return" = "exec ${pkgs.foot}/bin/foot";
      "Mod4+B" = "exec ${pkgs.brave}/bin/brave";
      "Mod4+E" = "exec ${pkgs.foot}/bin/foot -e ${pkgs.yazi}/bin/yazi";
      "Mod4+Shift+E" = "exec ${pkgs.nautilus}/bin/nautilus";
      "Mod4+M" = "exec spotify";
      "Mod4+O" = "exec ${pkgs.obsidian}/bin/obsidian";
      "Mod4+N" = "exec ${pkgs.foot}/bin/foot -e nvim";
      "Mod4+Shift+B" = "exec ${pkgs.foot}/bin/foot -e bluetui";
      "Mod4+Shift+N" = "exec ${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
      "Mod4+Escape" = "exec wlogout";
      "Mod4+Shift+W" = "exec rofi-wallpaper";

      # Screenshots
      "Mod4+Shift+S" = "exec ${./screenshot.sh}";
      "Print" = "exec ${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy && ${pkgs.wl-clipboard}/bin/wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png";
    };
  };
}
