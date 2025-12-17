{
  config,
  pkgs,
  ...
}: {

imports = [
  ./configs/sway-jsonc.nix
];

  programs.waybar.enable = true;

  # Install the actual config files from this directory
  xdg.configFile."waybar/hyprland.jsonc".source = ./hyprland.jsonc;
  xdg.configFile."waybar/hyprland.css".source = ./hyprland.css;
  xdg.configFile."waybar/niri.jsonc".source = ./niri.jsonc;
  xdg.configFile."waybar/niri.css".source = ./niri.css;
  # xdg.configFile."waybar/sway.jsonc".source = ./sway.jsonc;
  xdg.configFile."waybar/sway.css".source = ./sway.css;

  xdg.configFile."waybar/scripts" = {
    source = ./scripts;
    recursive = true;
  };

  # colors.css still needs Stylix interpolation, so we generate it from Nix
  xdg.configFile."waybar/colors.css".text = ''
    @define-color background                  #${config.stylix.base16Scheme.base00};
    @define-color border                      #${config.stylix.base16Scheme.base03};
    @define-color text                        #${config.stylix.base16Scheme.base05};

    /* workspaces */
    @define-color ws-focused                  #${config.stylix.base16Scheme.base0A};
    @define-color ws-active-text              #${config.stylix.base16Scheme.base0B};
    @define-color ws-persistent-text          #${config.stylix.base16Scheme.base07};
    @define-color ws-urgent                   #${config.stylix.base16Scheme.base08};

    /* semantic colors */
    @define-color warning                     #${config.stylix.base16Scheme.base09};
    @define-color critical                    #${config.stylix.base16Scheme.base08};
    @define-color muted                       #${config.stylix.base16Scheme.base03};

    /* module borders / accents */
    @define-color window-border               #${config.stylix.base16Scheme.base0E};
    @define-color tray-border                 #${config.stylix.base16Scheme.base02};
    @define-color tray-bg                     #${config.stylix.base16Scheme.base01};
    @define-color disk-border                 #${config.stylix.base16Scheme.base08};
    @define-color cpu-border                  #${config.stylix.base16Scheme.base09};
    @define-color temp-border                 #${config.stylix.base16Scheme.base0A};
    @define-color backlight-border            #${config.stylix.base16Scheme.base0A};
    @define-color memory-border               #${config.stylix.base16Scheme.base0C};
    @define-color audio-border                #${config.stylix.base16Scheme.base0D};
    @define-color battery-border              #${config.stylix.base16Scheme.base0B};
    @define-color clock-border                #${config.stylix.base16Scheme.base0A};
    @define-color network-border              #${config.stylix.base16Scheme.base0E};

    /* mode indicator */
    @define-color mode-bg                     #${config.stylix.base16Scheme.base0D};
    @define-color mode-border                 #${config.stylix.base16Scheme.base0C};
    @define-color mode-text                   #${config.stylix.base16Scheme.base00};
  '';
  #
  # systemd.user.services.waybar = {
  #   Unit = {
  #     Description = "Waybar status bar";
  #     PartOf = [ "hyprland-session.target" ];
  #     After = [ "hyprland-session.target" " xdg-desktop-portal.service" ];
  #   };
  #
  #   Service = {
  #     ExecStart = "${pkgs.waybar}/bin/waybar";
  #     Restart = "on-failure";
  #     Environment = "XDG_CURRENT-DESKTOP=Hyprland";
  #   };
  #   Install = { WantedBy = [ "hyprland-session.target" ]; };
  # };
}
