{
  imports = [
    ../../system/configuration.nix
    # ../../system/modules.nix

    ./hardware-configuration.nix
    ./system
    ./minecraft

    ./programs/fish
  ];

  networking = {
    networkmanager.enable = true;
    hostName = "desktop";
  };
}
