{ pkgs, ... }:

let
  # Commands (rough equivalents of your Hyprland variables)
  terminal  = "${pkgs.ghostty}/bin/ghostty";
  browser   = "${pkgs.brave}/bin/brave";
  menu      = "${pkgs.rofi}/bin/rofi";

  explorer1 = "terminal -e ${pkgs.yazi}/bin/yazi";

  explorer2 = "${pkgs.nautilus}/bin/nautilus";
  notes     = "${pkgs.obsidian}/bin/obsidian";
  emoji     = "${pkgs.bemoji}/bin/bemoji";

  bluetooth = "terminal -e ${pkgs.bluetui}/bin/bluetui";

  editor    = "terminal -e nvim";

in {
  programs.niri.settings = {

    # This is the Nix-native representation of niri's KDL config.
    binds = {
      ################################
      ## Basic window management
      ################################

      # $mod, Q, killactive,
      "Mod+Q".action.close-window = [ ];

      # There is no direct “force kill” like your
      # `hyprctl activewindow | ... | xargs kill` line.
      # If you really want it, write a small script that uses
      # `niri msg action focused-window-info` + `kill` and bind
      # it here with spawn-sh.

      # $mod, V, togglefloating,
      "Mod+V".action.toggle-window-floating = [ ];

      # $mod, F, fullscreen, 1
      # $mod SHIFT, F, fullscreen, 0
      # Mapped to niri’s maximize & fullscreen.
      "Mod+F".action.maximize-column   = [ ];
      "Mod+Shift+F".action.fullscreen-window = [ ];

      ################################
      ## App launches
      ################################

      # $mod, return, exec, $terminal
      "Mod+Return".action.spawn = terminal;

      # $mod, B, exec, $browser
      "Mod+B".action.spawn = browser;

      # $mod, E, exec, $explorer1
      "Mod+E".action.spawn = explorer1;

      # $mod SHIFT, E, exec, $explorer2
      "Mod+Shift+E".action.spawn = explorer2;

      # $mod, M, exec, spotify
      "Mod+M".action.spawn = "spotify";

      # $mod, O, exec, $notes
      "Mod+O".action.spawn = notes;

      # $mod, N, exec, $editor
      "Mod+N".action.spawn = editor;

      # $mod SHIFT, B, exec, $bluetooth
      "Mod+Shift+B".action.spawn = bluetooth;

      # $mod SHIFT, N, exec, $noti-center
      "Mod+Shift+N".action.spawn = [
        "${pkgs.swaynotificationcenter}/bin/swaync-client"
        "-t"
        "-sw"
      ];

      # $mod, ESCAPE, exec, wlogout
      "Mod+Escape".action.spawn = "${pkgs.wlogout}/bin/wlogout";

      # $mod, Z, exec, $colorPicker
      "Mod+Z".action.spawn = [
        "${pkgs.hyprpicker}/bin/hyprpicker"
        "-a"
      ];

      # $mod SHIFT, W, exec, rofi-wallpaper
      "Mod+Shift+W".action.spawn = "rofi-wallpaper";

      "Mod+Shift+R".action.spawn = "${./reload.sh}";

      ################################
      ## Screenshots
      ################################

      # $mod SHIFT, S, exec, ./screenshot.sh
      "Mod+Shift+S".action.spawn = "${./screenshot.sh}";

      # , Print, exec, grim | wl-clipboard | save file
      "Print".action.spawn-sh =
        "${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy && ${pkgs.wl-clipboard}/bin/wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png";

      ################################
      ## Rofi / emoji / clipboard
      ################################

      # $mod, Space, exec, $menu -show drun
      "Mod+Space".action.spawn = [
        menu
        "-show"
        "drun"
      ];

      # $mod, U, exec, $emoji
      "Mod+U".action.spawn = emoji;

      # $mod, Y, exec, cliphist list | rofi -dmenu | ...
      "Mod+Y".action.spawn-sh =
        "cliphist list | ${menu} -dmenu | cliphist decode | wl-copy";

      ################################
      ## Focus movement (H J K L)
      ################################

      # $mod, H/L/J/K, movefocus, l/r/d/u
      "Mod+H".action.focus-column-left  = [ ];
      "Mod+L".action.focus-column-right = [ ];
      "Mod+J".action.focus-window-down  = [ ];
      "Mod+K".action.focus-window-up    = [ ];

      ################################
      ## Move windows / columns (Mod+Ctrl+HJKL)
      ################################

      # $mod CTRL, H/L/J/K, movewindow, l/r/d/u
      # Horizontal moves are mapped to move-column-* (closest niri primitive).
      "Mod+Ctrl+H".action.move-column-left  = [ ];
      "Mod+Ctrl+L".action.move-column-right = [ ];
      "Mod+Ctrl+J".action.move-window-down  = [ ];
      "Mod+Ctrl+K".action.move-window-up    = [ ];

      ################################
      ## Workspaces
      ################################

      # $mod, 1..0, workspace, N
      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;
      "Mod+0".action.focus-workspace = 10;

      # $mod SHIFT, 1..0, movetoworkspace, N
      # (Hypr moves the active window → use move-window-to-workspace)
      "Mod+Shift+1".action.move-window-to-workspace = 1;
      "Mod+Shift+2".action.move-window-to-workspace = 2;
      "Mod+Shift+3".action.move-window-to-workspace = 3;
      "Mod+Shift+4".action.move-window-to-workspace = 4;
      "Mod+Shift+5".action.move-window-to-workspace = 5;
      "Mod+Shift+6".action.move-window-to-workspace = 6;
      "Mod+Shift+7".action.move-window-to-workspace = 7;
      "Mod+Shift+8".action.move-window-to-workspace = 8;
      "Mod+Shift+9".action.move-window-to-workspace = 9;
      "Mod+Shift+0".action.move-window-to-workspace = 10;

      ################################
      ## Resize (approximate your binde)
      ################################

      # $mod SHIFT, H/L, resizeactive, ±50 0
      "Mod+Shift+H".action.set-column-width = "-10%";
      "Mod+Shift+L".action.set-column-width = "+10%";

      # $mod SHIFT, J/K, resizeactive, 0 ±50
      "Mod+Shift+J".action.set-window-height = "-10%";
      "Mod+Shift+K".action.set-window-height = "+10%";

      ################################
      ## Volume / mic / brightness (bindel)
      ################################

      # ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      "XF86AudioLowerVolume".action.spawn-sh =
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";

      # ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      "XF86AudioRaiseVolume".action.spawn-sh =
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";

      # ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      "XF86AudioMute".action.spawn-sh =
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

      # ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      "XF86AudioMicMute".action.spawn-sh =
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

      # ,XF86MonBrightnessUp, exec, brightnessctl set 5%+
      "XF86MonBrightnessUp".action.spawn = [
        "brightnessctl"
        "set"
        "5%+"
      ];

      # ,XF86MonBrightnessDown, exec, brightnessctl set 5%-
      "XF86MonBrightnessDown".action.spawn = [
        "brightnessctl"
        "set"
        "5%-"
      ];

      ################################
      ## Media keys (bindl)
      ################################

      # ",XF86AudioNext, exec, playerctl next"
      "XF86AudioNext".action.spawn-sh = "playerctl next";

      # ",XF86AudioPause, exec, playerctl play-pause"
      "XF86AudioPause".action.spawn-sh = "playerctl play-pause";

      # ",XF86AudioPlay, exec, playerctl play-pause"
      "XF86AudioPlay".action.spawn-sh = "playerctl play-pause";

      # ",XF86AudioPrev, exec, playerctl previous"
      "XF86AudioPrev".action.spawn-sh = "playerctl previous";
    };
  };
}
