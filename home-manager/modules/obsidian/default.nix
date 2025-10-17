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
    enable = false;
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
          communityPlugins = [
            "obsidian-git"
            "obsidian-relative-line-numbers"
            "templater-obsidian"
            "table-editor-obsidian"
            "homepage"
            "dataview"
            "obsidian-hider"
            "obsidian-style-settings"
            "settings-search"
            "obsidian-vimrc-support"
            "obsidian-scroll-offset"
            "obsidian-icon-folder"
            "oz-clear-unused-images"
            "multi-properties"
            "obsidian-tasks-plugin"
            "calendar"
            "home-tab"
            "new-tab-default-page"
            "editor-width-slider"
            "contribution-graph"
            "simple-banner"
          ];
        };
      };
    };
  };
}
