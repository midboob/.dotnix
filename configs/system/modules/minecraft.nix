{
  pkgs,
  inputs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    prismlauncher
    lunar-client
    jdk8
    jdk21
  ];
}
