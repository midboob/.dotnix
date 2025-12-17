
{ config, pkgs, lib, ... }:

{
  imports = [
    ../../system/configuration.nix
    ../../system/modules.nix

    ./hardware-configuration.nix
  ];

  networking = {
    networkmanager.enable = true;
    hostName = "t480s";
  };
}
