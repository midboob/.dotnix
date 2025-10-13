{ pkgs, lib, config, ...}: {

	stylix.targets.obsidian = {
    enable = true;
  };
  programs.obsidian.enable = true;
}
