{pkgs, ...}: {
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true; # recommended on the wiki
    };
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["wlr" "gtk"];
      sway.default = ["wlr" "gtk"];
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };
}
