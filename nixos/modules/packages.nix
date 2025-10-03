{ pkgs, inputs,... }: {

	environment.systemPackages = with pkgs; [

    # Wayland
		ghostty

		hyprpicker
		grim
		slurp
    hyprlock
		swaynotificationcenter
		waypaper
		waybar
    swww

		gnome-keyring
		cliphist
		wl-clipboard

		xdg-desktop-portal
		xdg-desktop-portal-gtk
		xdg-desktop-portal-hyprland

		# Desktop apps
		obs-studio
		pavucontrol
		overskride
		anki-bin
		bleachbit
		gimp
		obsidian
		zathura
		mpv
		qbittorrent
		kitty
		brave
		rofi
		nautilus
		networkmanagerapplet
		switcheroo
		localsend
		openrgb
    hellwal
    inputs.matugen.packages.${pkgs.system}.default
    zoom-us
		seahorse

		# CLI
		brightnessctl
		ani-cli
		bluetui
		oh-my-posh
		eza
		yazi
    neovim
		bluez
		bat
		btop
		curl
		fastfetch
		ffmpeg
		file
		fzf
		git
		killall
		lazydocker
		lazygit
		ncdu
		ntfs3g
		progress
		ripgrep
		tmux
		tree
		unzip
		watch
		wget
		zip
		lua
		gh
		sl
		chntpw
		gnome-network-displays

		# Other
		gcc
		clang
		zig
		home-manager
	];

	fonts.packages = with pkgs; [
		dina-font
		fira-code
		fira-code-symbols
		liberation_ttf
		mplus-outline-fonts.githubRelease
		nerd-fonts.fira-code
		nerd-fonts.symbols-only
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-emoji
		proggyfonts
	];
}
