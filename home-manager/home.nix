{
	imports = [
		./modules.nix
	];

	home = {
		username = "edward";
		homeDirectory = "/home/edward";
		stateVersion = "25.05";
	};

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
