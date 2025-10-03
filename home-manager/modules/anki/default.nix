{ lib, pkgs, ... }: {
	stylix.targets.anki.enable = true;

	programs.anki = {
		enable = true;

		addons = [ pkgs.ankiAddons.review-heatmap ];
	};
}
