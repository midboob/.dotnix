{
  pkgs,
  config,
  lib,
  ...
}: {
  wayland.windowManager.sway.config = {
    bars = [];

    defaultWorkspace = "workspace 1";

    output = {
      "*" = {
        mode = "2560x1440@180.002Hz";
        pos = "0 0";
        scale = "1";
      };
    };

    startup = [
      {command = "swww-daemon";}
      {command = "${pkgs.openrgb}/bin/openrgb --profile ~/.config/OpenRGB/black.orp";}

      # Set volume to 100%
      {command = "sleep 4 && ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 1";}
      {command = "sleep 5 && ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 1";}

      # Clipboard history
      {command = "${pkgs.cliphist}/bin/cliphist wipe";}
      {command = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";}
    ];

    window = {
      border = 1;
      titlebar = false;
    };

    input = {
      "*" = {
        xkb_layout = "us";
        accel_profile = "flat";
        pointer_accel = "0.0";
        xkb_numlock = "enabled";
      };

      "type:touchpad" = {
        natural_scroll = "disabled";
      };
    };

    focus = {
      followMouse = "yes";
    };
  };
}
