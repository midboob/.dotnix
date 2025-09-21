{ pkgs, lib, ...}: {

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        enableLuaLoader = true;
        
        viAlias = false;
        vimAlias = true;
        lsp = {
          enable = true;
        };

        theme = {
          enable = true;
          name = "rose-pine";
          style = "main";
        };

        utility.snacks-nvim = {
          enable = true;
          setupOpts = { dashboard = true; };
        };

      # options = {
      #   "vim.o.number" = true;
      #   "vim.o.relativenumber" = true;
      #   "vim.o.expandtab" = true;
      #   "vim.o.shiftwidth" = 2;
      #   "vim.o.tabstop" = 2;
      #   "vim.o.termguicolors" = true;
      #   "vim.o.cursorline" = true;
      #   };
      };
    };
  };
}
