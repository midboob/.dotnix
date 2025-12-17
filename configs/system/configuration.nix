{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    # /etc/nixos/hardware-configuration.nix
    ./modules.nix
  ];
  i18n.defaultLocale = "en_US.UTF-8";

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/edward/.dotnix";
  };

  # networking = {
  #   networkmanager.enable = true;
  #   hostName = "nixos";
  # };

  time = {
    timeZone = "America/Los_Angeles";
    hardwareClockInLocalTime = true;
  };

  services.displayManager.ly.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
