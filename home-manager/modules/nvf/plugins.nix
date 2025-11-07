{
  lib,
  config,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        visuals = {
          nvim-web-devicons.enable = true;
        };

        utility = {
          snacks-nvim = {
            enable = true;
            setupOpts = {
              animate = {enabled = true;};
              dashboard = {enabled = false;};
              :q
              bigfile = {enabled = true;};
              notifier = {enabled = true;};
              image = {enabled = true;};
              toggle = {enabled = true;};
              input = {
                enabled = true;
                position = "float"; # works via Snacks' window config
                border = "rounded";
              };
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

        mini = {
          pairs.enable = true;
          surround.enable = true;
        };
      };
    };
  };
}
