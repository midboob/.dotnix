{ pkgs, lib, config, ... }: {

  programs.nvf = {
    enable = true;
    settings = {
      vim.statusline.lualine = {
        enable = true;
      };
    };
  };
}
