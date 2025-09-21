{ pkgs, ... }: {

	programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      portalPackage = pkgs.xdg-desktop-portal-gtk;
    };

    xwayland.enable = true;
	};

	environment.sessionVariables = {
    GSK_RENDERER = "ngl";
		# GTK_USE_PORTAL = "0";
		GDK_BACKEND = "wayland,x11";
		# SDL_VIDEODRIVER = "wayland";
		CLUTTER_BACKEND = "wayland";
		QT_QPA_PLATFORMTHEME = "qt5ct";
		ELECTRON_OZONE_PLATFORM_HINT = "wayland";
		XDG_SESSION_TYPE = "wayland";
		NIXOS_OZONE_WL = "1";
	};

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.ly.enableGnomeKeyring = true;


	xdg = {
		portal = {
      enable = true;
			xdgOpenUsePortal = true;
			config = {
				common.default = [ "hyprland" "gtk" ];
				hyprland.default = [ "hyprland" "gtk" ];
			};
			extraPortals = with pkgs; [
				xdg-desktop-portal-hyprland
				xdg-desktop-portal-gtk
			];
		};
	};

	xdg.mime.defaultApplications = {
		"text/html" = "brave-browser.desktop";
		"image/*" = "eog.desktop";
		"video/*" = "mpv.desktop";
		"inode/directory" = "org.gnome.Nautilus.desktop";
	};
}
