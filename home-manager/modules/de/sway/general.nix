{pkgs, config, lib, ...}: {
    wayland.windowManager.sway.config = {
        output = {
            DP-5 = {
                mode = "1920x1080@144.001";
                pos = "0x0";
                scale = "1";
              };
          };
      };
  }
