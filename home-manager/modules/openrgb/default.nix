{ config, pkgs, ... }:
let
  openrgbBin = "${pkgs.openrgb}/bin/openrgb";
  profile    = "%h/.config/OpenRGB/white.orp";  # %h expands to $HOME in systemd user units
in {
  systemd.user.services.openrgb-profile = {
    Unit = {
      Description = "Apply OpenRGB profile at login";
      After = [ "graphical-session.target" ];
      Wants = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${openrgbBin} --no-gui --profile ${profile}";
      # If you prefer headless: ExecStart = "${openrgbBin} --no-gui --profile ${profile}";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ]; # or "graphical-session.target" on newer HM setups
    };
  };
}
