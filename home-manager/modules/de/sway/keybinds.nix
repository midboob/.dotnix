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
      "Mod4+Return" = "exec ${pkgs.foot}/bin/foot";
    };
  };
}
