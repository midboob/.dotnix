{
  config,
  pkgs,
  ...
}: {
  programs.waybar.enable = true;

  # Install the actual config files from this directory
  xdg.configFile."waybar/hyprland.jsonc".source = ./hyprland.jsonc;
  xdg.configFile."waybar/niri.jsonc".source = ./niri.jsonc;
  xdg.configFile."waybar/sway.jsonc".source = ./sway.jsonc;
  xdg.configFile."waybar/hyprland.css".source = ./hyprland.css;
  xdg.configFile."waybar/niri.css".source = ./niri.css;
  xdg.configFile."waybar/sway.css".source = ./sway.css;

  xdg.configFile."scripts" = {
    source = ./scripts;
    recursive = true;
  };

  # colors.css still needs Stylix interpolation, so we generate it from Nix
  xdg.configFile."waybar/colors.css".text = ''
    @define-color background                  #${config.stylix.base16Scheme.base00};
    @define-color border                      #${config.stylix.base16Scheme.base03};
    @define-color text                        #${config.stylix.base16Scheme.base05};
    @define-color ws-focused                  #${config.stylix.base16Scheme.base0A};
    @define-color ws-active-text              #${config.stylix.base16Scheme.base05};
    @define-color ws-persistent-text          #${config.stylix.base16Scheme.base07};
    @define-color ws-urgent                   #${config.stylix.base16Scheme.base08};
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
