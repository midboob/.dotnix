{
  pkgs,
  lib,
  config,
  ...
}: {
  stylix.targets.obsidian = {
    enable = true;
    vaultNames = ["notes"];
  };
  programs.obsidian = {
    enable = true;
    vaults = {
      notes = {
        enable = true;
        target = "/Documents/notes/";
        settings = {
          app = {
            "promptDelete" = false;
            "vimMode" = true;
            "showLineNumber" = true;
            "readableLineLength" = false;
            "attachmentFolderPath" = "999 Images";
            "newFileLocation" = "current";
            "alwaysUpdateLinks" = true;
            "strictLineBreaks" = false;
            "newFileFolderPath" = "000 Index";
            "showInlineTitle" = true;
          };
          cssSnippets = [
            ./snippets/DV-Button.css
            ./snippets/Hide-Properties-Class.css
            ./snippets/mathjax-font.css
            ./snippets/Tags-Edit.css
          ];
        };
      };
    };
  };
}
