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
          
          # # Better up/down
          # { mode = [ "n" "x" ]; key = "j"; action = "v:count == 0 ? 'gj' : 'j'"; silent = true; desc = "Down"; }
          # { mode = [ "n" "x" ]; key = "<Down>"; action = "v:count == 0 ? 'gj' : 'j'"; silent = true; desc = "Down"; }
          # { mode = [ "n" "x" ]; key = "k"; action = "v:count == 0 ? 'gk' : 'k'"; silent = true; desc = "Up"; }
          # { mode = [ "n" "x" ]; key = "<Up>"; action = "v:count == 0 ? 'gk' : 'k'"; silent = true; desc = "Up"; }

          # Snacks
          { key = "<leader><space>"; mode = ["n" "v"]; action = "<cmd>lua Snacks.picker.smart()<cr>"; silent = true; desc = "Smart Find Files"; }
          { key = "<leader>,"; mode = ["n" "v"]; action = "<cmd>lua Snacks.picker.buffers()<cr>"; silent = true; desc = "Buffers"; }
          { key = "<leader>/"; mode = ["n" "v"]; action = "<cmd>lua Snacks.picker.grep()<cr>"; silent = true; desc = "Grep"; }

          # Buffers
          { mode = [ "n" ]; key = "<leader>bd"; action = "<cmd>lua Snacks.bufdelete()<CR>"; desc = "Delete Buffer"; }

          # Better Indenting
          { mode = [ "v" ]; key = "<"; action = "<gv"; }
          { mode = [ "v" ]; key = ">"; action = ">gv"; }

        ];
      };
    };
  };
}
