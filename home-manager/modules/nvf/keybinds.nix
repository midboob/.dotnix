{

  programs.nvf = {
    enable = true;
    settings = {
      vim.keymaps = [

        {
        key = "<leader><space>";
        mode = ["n" "v"];
        action = "function() Snacks.picker.smart() end";
        silent = true;
        desc = "Smart Find Files";
        }

      ];
    };
  };
}
