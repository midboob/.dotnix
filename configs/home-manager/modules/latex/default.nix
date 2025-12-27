{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    (texlive.combine {
      inherit
        (texlive)
        latexmk
        amsmath
        amsfonts
        geometry
        hyperref
        biblatex
        xcolor
        fontspec
        ;
    })
    texliveFull
  ];

  programs.texlive = {
    enable = true;
    # package = pkgs.texliveFull;
  };
}
