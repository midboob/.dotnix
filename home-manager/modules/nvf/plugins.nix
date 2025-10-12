{ lib, config, ...}: {

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        utility = {

          snacks-nvim = {
            enable = true;
            setupOpts = {
              animate = {
                enable = true;
                easing = "linear";
                fps = 60;
              };
              dashboard.enable = true;
              bigfile.enabled = true;
              picker.enabled = true;
              notifier.enabled = true;
              image.enabled = true;
              toggle.enabled = true;
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
