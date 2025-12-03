{pkgs, lib, config, ...}: {
  services = {
    gnome.gnome-keyring.enable = true;
    upower.enable = true;
    usbmuxd = {
      enable = true;
    };
  };
}
