{ pkgs, inputs, ... }: 

let
  pref-by-location-plugin = pkgs.fetchFromGitHub {
    owner = "boydaihungst";
    repo = "pref-by-location.yazi";
    rev = "882e75297a2a07cd892e383800d493ad484f7eec";
    sha256 = "17k4w0k9s40g1mkz887lj2c1dvz4q2rlflnsrsxb618r5dqd48z0";
  };
in 

{

  stylix.targets.yazi.enable = true;

  programs.yazi = {
    enable = true;

    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = true;

    settings = {
      mgr = {
        ratio = [ 1 4 3 ];
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        sort_translit = false;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
        scrolloff = 5;
        mouse_events = [ "click" "scroll" ];
        title_format = "Yazi: {cwd}";
        
      };

      preview = {
        wrap = "yes";
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
        image_delay = 30;
        image_filter = "triangle";
        image_quality = 90;
        sixel_fraction = 15;
        ueberzug_scale = 1;
        ueberzug_offset = [ 0 0 0 0 ];
      };

      opener.edit = [
          { run = ''nvim "$@"''; block = true; for = "unix"; }
        ];
    };

    keymap = {
      mgr.prepend_keymap = [
        { run = "plugin bunny"; on = [ ";" ]; desc = "Start bunny.yazi"; }
      ];
    };

    plugins = {
      "full-border" = pkgs.yaziPlugins.full-border;
      "bunny" = "${inputs.bunny-yazi}";
      "pref-by-location" = pref-by-location-plugin;
    };

    initLua = ''
      require("full-border"):setup()
      require("pref-by-location"):setup({})

      require("bunny"):setup({
        hops = {
          { key = "/", path = "/" },
          { key = "t", path = "/tmp" },
          { key = "h", path = "~", desc = "Home" },
          { key = "d", path = "~/Downloads/", desc = "Downloads" },
          { key = "D", path = "~/Documents", desc = "Documents" },
          { key = "c", path = "~/.config", desc = "Config" },
          { key = "n", path = "~/.dotnix", desc = "Nix Config" },
          { key = { "l", "s" }, path = "~/.local/share", desc = "Local share" },
          { key = { "l", "b" }, path = "~/.local/bin", desc = "Local bin" },
          { key = { "l", "t" }, path = "~/.local/state", desc = "Local state" },
          { key = { "s", "p" }, path = "/mnt/Storage/Pictures", desc = "Storage Pictures" },
        },
        desc_strategy = "path", 
        ephemeral = true, 
        tabs = true, 
        notify = false, 
        fuzzy_cmd = "fzf", 
      })
    '';
  };
}
