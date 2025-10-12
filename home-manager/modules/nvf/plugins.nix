{ lib, config, ...}: {

  programs.nvf = {
    enable = true;
    settings = {
      vim.utility = {

        snacks-nvim = {
          enable = true;
          setupOpts = {
            bigfile.enable = true;
            indent = true;
            notifier.enable = true;
            picker.enable = true;
            image.enable = true;
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
    };
  };
}
