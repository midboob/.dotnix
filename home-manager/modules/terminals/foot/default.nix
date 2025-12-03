{
  pkgs,
  config,
  lib,
  ...
}: {
  stylix.targets.foot.enable = true;

  programs.foot = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      main = {
        pad = "10x10";
      };
      scrollback = {
        lines = 2000;
        multiplier = 1.0;
      };
      cursor = {
        blink = "yes";
        blink-rate = 500;
      };
      bell = {
        system = "no";
      };
      colors = {
        alpha = "0.8";
      };
      csd = {
        preferred = "none";
      };
    };
  };
}
