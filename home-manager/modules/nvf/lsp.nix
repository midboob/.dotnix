{
  lib,
  config,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        lsp = {
          enable = true;
          formatOnSave = true;
          lspconfig = {
            enable = true;
          };
          # servers = {
          #   nixd.settings.nil.nix.autoArchive = true;
          # };
        };
        languages = {
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
            lsp = {
              enable = true;
              server = "nixd";
            };
            treesitter.enable = true;
          };

          markdown = {
            enable = true;
            extensions.render-markdown-nvim = {
              enable = true;
              setupOpts = {
                file_types = ["markdown"];

                checkbox = {
                  enabled = true;
                  custom = {
                    todo = {
                      raw = "[~]";
                      rendered = "󰥔 ";
                      highlight = "RenderMarkdownTodo";
                      scope_highlight = "nil";
                    };
                    important = {
                      raw = "[s]";
                      rendered = "󰓎 ";
                      highlight = "DiagnosticWarn";
                    };
                  };
                };

                latex.enable = false;
                html = {
                  enable = true;
                  comment = {
                    conceal = false;
                  };
                };
                render_modes = true;
                anti_conceal = {
                  enabled = true;
                  ignore = {
                    code_background = true;
                    sign = true;
                  };
                  above = "0";
                  below = "0";
                };

                completions = {
                  lsp.enable = true;
                  blink.enable = true;
                };
              };
            };
            format.enable = false;
            lsp.enable = false;
            treesitter.enable = true;
          };

          typst = {
            enable = true;
            extensions.typst-preview-nvim = {
              enable = true;
              setupOpts = {
                follow_cursor = true;
                port = "1234";
              };
            };
            format = {
              enable = true;
              type = "typstyle";
            };
            lsp = {
              enable = true;
              server = "tinymist";
            };
            treesitter.enable = true;
          };

          bash = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
        };
      };
    };
  };
}
