{ lib, config, ...}: {

  programs.nvf = {
    enable = true;
    settings = {
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
    };
  };
}
