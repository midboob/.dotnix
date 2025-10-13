{ pkgs, lib, ...}: {

  imports = [
    ./plugins.nix
    ./lsp.nix
    ./keybinds.nix
    ./autocomplete.nix
    # ./obsidian.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        enableLuaLoader = true;
        
        viAlias = false;
        vimAlias = true;

        spellcheck = {
          enable = true;
          languages = [ "en" ];
        };

        theme = {
          enable = true;
          name = "rose-pine";
          style = "main";
        };

        options = {
          tabstop = 2;
          shiftwidth = 2;
			    signcolumn = "no";
			    autoindent = true;
          termguicolors = true;
          wrap = true;
        };

        clipboard = {
          enable = true;
          registers = "unnamedplus";
        };

      };
    };
  };
}
