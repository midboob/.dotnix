{
  pkgs,
  config,
  lib,
  ...
}: {
  wayland.windowManager.mango = {
    enable = true;
  };
}
