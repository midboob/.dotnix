{ lib, config, ...}: {

  programs.nvf = {
    enable = true
    settings = {
      vim.languages = {
        enableTreesitter = true;

        lua = {
          enable = true;
          format.enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };

        nix = {
          enable = true;
          format.enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };

        markdown = {
          enable = true;
          extensions.render-markdown-nvim.enable = true;
          format.enable = false;
          lsp.enable = false;
          treesitter.enable = true;
        };

        typst = {
          enable = true;
          extenstions.typst-preiew-nvim.enable = true;
          format = {
            enable = true;
            type = typstyle;
          };
          lsp = {
            enable = true;
            server = tinymist;
          };
          treesitter.enable = true;
        };

      };
    };
  };
}
