{
  pkgs,
  config,
  ...
}: {
  stylix.targets.rofi.enable = true;
  home.file.".config/rofi/config.rasi".source = ./config.rasi;

  home.file.".config/rofi/scripts/wallpaper.sh" = {
    source = ./wallpaper/wallpaper.sh; # keep your repo path here
    executable = true;
  };

  home.file.".config/rofi/scripts/powermenu.sh" = {
    source = ./powermenu.sh; # <-- your repo path
    executable = true;
  };

  home.file.".config/rofi/theme.rasi".text = ''    * { 
           highlight: bold italic;
           scrollbar: true; 
           background: #${config.stylix.base16Scheme.base00};
           background-alt: #${config.stylix.base16Scheme.base01};
           foreground: #${config.stylix.base16Scheme.base05};
           foreground-alt: #${config.stylix.base16Scheme.base06};
           border: #${config.stylix.base16Scheme.base03};
           active: #${config.stylix.base16Scheme.base0A};
           urgent: #${config.stylix.base16Scheme.base08};
           separatorcolor: @border;
           scrollbar-handle: @border;
           normal-background: @background;
           normal-foreground: @foreground; 
           alternate-normal-background: @background-alt;
           alternate-normal-foreground: @foreground;
           selected-normal-background: @active;
           selected-normal-foreground: @background;
           active-background: @active;
           active-foreground: @background;
           alternate-active-background: @active-background;
           alternate-active-foreground: @active-foreground;
           selected-active-background: @active;
           selected-active-foreground: @active-foreground;
           urgent-background: @urgent;
           urgent-foreground: @background;
           alternate-urgent-background: @urgent-background;
           alternate-urgent-foreground: @urgent-foreground;
           selected-urgent-background: @urgent;
           selected-urgent-foreground: @urgent-foreground;
           } '';

  home.packages = [
    (pkgs.writeShellApplication {
      name = "rofi-wallpaper";
      # Add whatever your script uses:
      runtimeInputs = with pkgs; [
        rofi # or rofi-wayland on Wayland
        swww
        libnotify # for notify-send
        findutils
        coreutils
        bash
      ];
      text = ''
        #!/usr/bin/env bash
        exec "${config.xdg.configHome}/rofi/scripts/wallpaper.sh"
      '';
    })

    (pkgs.writeShellApplication {
      name = "rofi-power";
      runtimeInputs = with pkgs; [
        rofi # or rofi on X11
        coreutils
        bash
        # optional: hyprlock swaylock i3lock libnotify (if you use them)
      ];
      text = ''
        #!/usr/bin/env bash
        exec "${config.xdg.configHome}/rofi/scripts/powermenu.sh"
      '';
    })
  ];
}
