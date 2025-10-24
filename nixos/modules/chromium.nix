{
  pkgs,
  lib,
  config,
  ...
}: {
  stylix.targets.chromium.enable = true;

  programs.chromium = {
    enable = true;
    homepageLocation = "file:///home/edward/.config/startpage/index.html";
    extraOpts = {
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = ["en-US"];
    };
  };
}
