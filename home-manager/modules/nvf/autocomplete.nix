{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        autocomplete = {
          blink-cmp = {
            enable = true;
            friendly-snippets.enable = true;
            setupOpts = {
              cmdline.keymap.preset = "super-tab";
              fuzzy.implementation = "lua";
            };
          };
        };
      };
    };
  };
}
