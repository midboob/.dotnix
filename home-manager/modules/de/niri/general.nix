{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.niri.settings = {
    outputs = {
      "eDP-1" = {
        position = {
          x = 0;
          y = 0;
        };
        scale = 1.0;
      };

      "HDMI-A-2" = {
        mode = "1920x1080@60";
        position = {
          x = 2560;
          y = 0;
        };
        scale = 1.0;
      };
    };

    spawn-at-startup = [
      {command = ["swww-daemon"];}

      {
        command = [
          "${pkgs.openrgb}/bin/openrgb"
          "--profile"
          "${config.home.homeDirectory}/.config/OpenRGB/black.orp"
        ];
      }

      {
        command = [
          "${pkgs.bash}/bin/bash"
          "-lc"
          "sleep 4 && ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 1"
        ];
      }
      {
        command = [
          "${pkgs.bash}/bin/bash"
          "-lc"
          "sleep 5 && ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 1"
        ];
      }

      {command = ["${pkgs.cliphist}/bin/cliphist" "wipe"];}
      {
        command = [
          "${pkgs.wl-clipboard}/bin/wl-paste"
          "--type"
          "text"
          "--watch"
          "${pkgs.cliphist}/bin/cliphist"
          "store"
        ];
      }
    ];

    layout = {
      gaps = 5;

      border = {
        width = 2.0;
        active-color = "#${config.stylix.base16Scheme.base0A}";
        inactive-color = "#${config.stylix.base16Scheme.base01}";
      };

      shadow = {
        enable = true;
        softness = 30;
        spread = 5;
        offset = {
          x = 0;
          y = 5;
        };
        color = "rgba(26, 26, 26, 0.93)";
      };
    };

    input = {
      focus-follows-mouse = {
        enable = true;
      };

      keyboard.xkb.layout = "us";

      keyboard."numlock-on".enable = true;

      pointer = {
        "accel-profile" = "flat";
        "accel-speed" = 0.0;
      };

      touchpad = {
        "natural-scroll" = false;
        "scroll-factor" = 1.0;
      };
    };
  };
}
