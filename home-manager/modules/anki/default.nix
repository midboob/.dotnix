{ lib, ... }: {
	stylix.targets.anki.enable = true;
	programs.anki = {
		enable = true;

		sync = {
			enable = true;
			username = "edwarddan72@gmail.com";
			passwordFile = ./pass.txt;
			url = "https://ankiweb.net";
			syncMedia = true;
			autoSync = true;
			autoSyncMediaMinutes = 15;
			networkTimeout = 30;
		};
	};
}
