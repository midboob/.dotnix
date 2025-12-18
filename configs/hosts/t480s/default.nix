
{ config, pkgs, lib, ... }:

{
  imports = [
    ../../system/configuration.nix
    # ../../system/modules.nix

    ./hardware-configuration.nix
    ./system

    ./programs/fish
  ];

  networking = {
    networkmanager.enable = true;
    hostName = "t480s";
  };
}
