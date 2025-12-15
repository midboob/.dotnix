{config, ...}: {

  stylix.targets.grub = {
      enable = true;
      useWallpaper = true;
    };

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
      };
    };
  };
}
