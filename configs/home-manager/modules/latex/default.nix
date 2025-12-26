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
        amssymb
        geometry
        graphicx
        hyperref
        biblatex
        xcolor
        fontspec
        ;
    })
  ];

  programs.texlive = {
    enable = true;
    pakage = pkgs.texliveFull;
  };
}
