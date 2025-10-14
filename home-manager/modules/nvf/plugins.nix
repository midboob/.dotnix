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
              animate.enable = true;
              dashboard = {
                enable = true;
                example = "github";
              };
              bigfile.enabled = true;
              picker.enabled = true;
              notifier.enabled = true;
              image.enabled = true;
              toggle.enable = true;
              input = {
                enable = true;
                position = "float";
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
