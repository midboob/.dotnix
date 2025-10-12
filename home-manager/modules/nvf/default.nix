{ pkgs, lib, ...}: {

  imports = [
    ./plugins.nix
    ./lsp.nix
  ];

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

        utility = {
          snacks-nvim = {
            enable = true;
            setupOpts = {
              bigfile.enable = true;
              picker.enable = true;
              dashboard.enable = true;
            };
          };
          
          yazi-nvim = {
            enable = true;  
            mappings = {
              openYazi = "<space>e";
              openYaziDir = "<space>E";
            };
          };
          
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
