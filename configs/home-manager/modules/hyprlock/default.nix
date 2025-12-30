{
  stylix.targets.hyprlock.enable = true;

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };
      animations = {
        enabled = true;
      };
    };
  };
}
