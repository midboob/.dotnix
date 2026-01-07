{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    eagle
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];
}
