{
  lib,
  pkgs,
  ...
}: {
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraOptions = [
        "--unsupported-gpu"
      ];
    };
  };

  xdg.portal.config.sway.default = lib.mkForce ["wlr" "gtk"];
}
