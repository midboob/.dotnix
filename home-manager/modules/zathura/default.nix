{
  lib,
  config,
  ...
}: {
  stylix.targets.zathura.enable = true;
  programs.zathura = {
    enable = true;

    options = {
      selection-clipboard = "clipboard";
      incremental-search = true;
      search-hadjust = true;
      adjust-open = "width";
      font = "FiraCode Nerd Font 11";
      guioptions = "none";
    };
    #
    # extraConfig = let
    #   colours = config.lib.stylix.colors.withHashtag;
    # in ''
    #   set default-bg "${colours.base00}80"     # assuming you append hex alpha like '80'
    #   set default-fg "${colours.base07}"
    # '';

    mappings = {
      # Zoom in/out
      "[normal]     z" = "zoom in";
      "[normal]     Z" = "zoom out";
      "[fullscreen] z" = "zoom in";
      "[fullscreen] Z" = "zoom out";

      # Toggle mode
      "[normal]     D" = "toggle_page_mode";
      "[fullscreen] D" = "toggle_page_mode";

      # Scroll
      "[normal]     u" = "scroll half-up";
      "[normal]     d" = "scroll half-down";
      "[fullscreen] u" = "scroll half-up";
      "[fullscreen] d" = "scroll half-down";

      # Fullscreen
      "[normal]     f" = "toggle_fullscreen";
      "[fullscreen] f" = "toggle_fullscreen";

      # Reload
      "[normal]     <C-r>" = "reload";
      "[fullscreen] <C-r>" = "reload";

      # Status bar
      "[normal]     b" = "toggle_statusbar";
      "[fullscreen] b" = "toggle_statusbar";

      # Set width as in mupdf
      "[normal]     H" = "adjust_window best-fit";
      "[normal]     W" = "adjust_window width";
      "[fullscreen] H" = "adjust_window best-fit";
      "[fullscreen] W" = "adjust_window width";

      "[normal]     i" = "set recolor";
      "[fullscreen] i" = "set recolor";
    };
  };
}
