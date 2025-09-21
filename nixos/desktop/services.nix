{ config, pkgs, ... }: {
  # OpenRGB
  services.hardware.openrgb = {
    enable = true; 
    package = pkgs.openrgb; 
    motherboard = "amd"; 
  };

  systemd.user.services.openrgb-profile = {
    description = "Apply OpenRGB profile at boot";
    after = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
      ExecStart = "${pkgs.openrgb}/bin/openrgb --profile ~/.config/OpenRGB/white.orp";
      Restart = "on-failure";
      RestartSec = 2;
      ConditionPathExists = "%h/.config/OpenRGB/white.orp";
    };
  };
};
