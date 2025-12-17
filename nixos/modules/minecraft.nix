{
  pkgs,
  config,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    prismlauncher
    lunar-client
  ];
}
