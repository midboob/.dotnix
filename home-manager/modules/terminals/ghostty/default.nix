{ lib, pkgs, config, ... }: {
# stylix.targets.ghostty.enable = true;

  programs.ghostty = {
    enable = true;


    settings = {
      font-family = "Geist Mono";
      font-size = 12;

      theme = "matugen";

      window-decoration = true;
      window-padding-balance = true;
      window-padding-x = 10;
      window-padding-y = 10;

      # working-directory = "/home/edward"
      window-inherit-working-directory = false;

      keybind = [
        "ctrl+shift+k=new_split:up"
        "ctrl+shift+j=new_split:down"
        "ctrl+shift+l=new_split:right"
        "ctrl+shift+h=new_split:left"
        "ctrl+shift+n=new_tab"
        "ctrl+alt+n=new_window"
      ];

      background-opacity = 0.8;
      confirm-close-surface = false;
    };
    clearDefaultKeybinds = false;
    installVimSyntax = true;
    installBatSyntax = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
