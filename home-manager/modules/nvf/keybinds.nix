{

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        binds = {
          whichKey = {
            enable = true;
          };
        };
        keymaps = [

          # Snacks
          {
          key = "<leader><space>";
          mode = ["n" "v"];
          action = "<cmd>lua Snacks.picker.smart()<cr>";
          silent = true;
          desc = "Smart Find Files";
          }

          {
          key = "<leader>,";
          mode = ["n" "v"];
          action = "<cmd>lua Snacks.picker.buffers()<cr>";
          silent = true;
          desc = "Buffers";
          }

          {
          key = "<leader>/";
          mode = ["n" "v"];
          action = "<cmd>lua Snacks.picker.grep()<cr>";
          silent = true;
          desc = "Grep";
          }


        ];
      };
    };
  };
}
