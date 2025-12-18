{
  programs.fish = {
    enable = true;

		shellAliases = {
			nrs = "sudo nixos-rebuild switch --flake ~/.dotnix#t480s";
			nrb = "sudo nixos-rebuild boot --flake ~/.dotnix#t480s";
    };
  };
}
