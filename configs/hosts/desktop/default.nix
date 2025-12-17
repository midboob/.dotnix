
{ config, pkgs, lib, ... }:

{
  imports = [
    ../../system/configuration.nix
    # ../../system/modules.nix

    # ./hardware-configuration.nix
    ./system
  ];

  networking = {
    networkmanager.enable = true;
    hostName = "desktop";
  };
}
