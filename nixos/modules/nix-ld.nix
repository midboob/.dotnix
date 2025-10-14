{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.nix-lb = {
    enable = true;
  };
}
