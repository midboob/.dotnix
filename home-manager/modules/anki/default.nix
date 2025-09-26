{ lib, ... }: {
	stylix.targets.akni.enable = true;
	programs.anki = {
		enable = true;
	};
}
