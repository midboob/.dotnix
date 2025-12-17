{ config, ... }: {
  imports = [
    ./config.nix
  ];

  services.swaync = {
    enable = true;
    style = "${./style.css}";
  };

  home.file.".config/swaync/colors.css".text = ''
@define-color bg-primary   #${config.stylix.base16Scheme.base00};
@define-color bg-secondary #${config.stylix.base16Scheme.base01};
@define-color bg-tertiary  #${config.stylix.base16Scheme.base02};
@define-color bg-selected  #${config.stylix.base16Scheme.base03};

@define-color fg-primary   #${config.stylix.base16Scheme.base05};
@define-color fg-secondary #${config.stylix.base16Scheme.base04};
@define-color fg-tertiary  #${config.stylix.base16Scheme.base06};
@define-color fg-disabled  #${config.stylix.base16Scheme.base03};

@define-color accent-green  #${config.stylix.base16Scheme.base0B};
@define-color accent-orange #${config.stylix.base16Scheme.base09};
@define-color accent-red    #${config.stylix.base16Scheme.base08};
@define-color accent-blue   #${config.stylix.base16Scheme.base0D};
@define-color accent-purple #${config.stylix.base16Scheme.base0E};

@define-color border-primary #${config.stylix.base16Scheme.base03};
@define-color border-focus   #${config.stylix.base16Scheme.base0B};

/* Special-purpose colors (fixed, not stylix-based) */
@define-color mpris-album-art-overlay rgba(0, 0, 0, 0.55);
@define-color mpris-button-hover       rgba(0, 0, 0, 0.5);
  '';
}
