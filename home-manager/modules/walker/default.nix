{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = [
  walker
  ];
  services.walker = {
    enable = true;
  };
}
