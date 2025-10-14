{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  # nixCats Home Manager options
  nixCats = {
    enable = true;

    # Where your Lua config lives (normal Neovim layout: init.lua, lua/, after/, etc.)
    # You can start by copying the example from nixCats, or make your own.
    luaPath = ./nvim;

    # Build one package named "nixCats" and install it for this user.
    packageNames = ["nixCats"];

    # Define how that package is built (settings + categories).
    packageDefinitions.merge = {
      nixCats = {pkgs, ...}: {
        settings = {
          # Give your nvim a launch name and optional aliases.
          # Aliases must not collide with other Neovim builds in your profile.
          aliases = ["nvim"];
          wrapRc = true;
          configDirName = "nixcats"; # just a label used by nixCats
        };

        # Enable some canned category groups; tweak to taste later.
        # (These expand to plugins/tools under the hood.)
        categories = {
          general = true;
          gitPlugins = true;
          markdown = true;
          treesitter = true;
          lspDebugMode = false;

          # Pick any packaged colorscheme; 'onedark' is a common default.
          colorscheme = "onedark";
        };
      };
    };
  };

  # (Optional) make it your default editor using nixCats’ exposed package:
  home.sessionVariables.EDITOR = let
    nvimpkg = config.nixCats.out.packages."nixCats";
  in "${nvimpkg}/bin/${nvimpkg.nixCats_packageName}";
}
