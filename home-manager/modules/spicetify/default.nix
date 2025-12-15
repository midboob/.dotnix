{
  inputs,
  pkgs,
  ...
}: {
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      keyboardShortcut
      hidePodcasts
      fullScreen
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
    ];
    # theme = {
    #   name = "text";                      # folder name / your choice
    #   src = ./themes/text;      # path inside your config/dotfiles
    #   injectCss = true;                       # typical for custom themes
    #   injectThemeJs = true;                   # set to true if your theme has JS
    #   replaceColors = true;                   # lets color.ini override Spotify colors
    #   homeConfig = true;                      # use theme for home config too
    # };
    theme = spicePkgs.themes.text;
    colorScheme = "RosePine";
  };
}
