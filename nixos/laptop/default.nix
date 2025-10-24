{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s
  ];

  powerManagement = {
    enable = true;
    powertop.enable = false;
  };
  services = {
    thermald.enable = true;

    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
        CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

        # CPU_MIN_PERF_ON_AC = 0;
        # CPU_MAX_PERF_ON_AC = 100;
        # CPU_MIN_PERF_ON_BAT = 0;
        # CPU_MAX_PERF_ON_BAT = 80;
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 1;
        STOP_CHARGE_THRESH_BAT0 = 90;
        START_CHARGE_THRESH_BAT0 = 0;
      };
    };

    power-profiles-daemon.enable = false;
    logind = {
      settings = {
        Login = {
          HandleLidSwitch = "suspend-then-hibernate";
          HandlePowerKeyLongPress = "hibernate";
          HandlePowerKey = "poweroff";
        };
      };
    };
  };
  boot.kernelParams = ["mem_sleep_default=deep"];

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=30m
    SuspendState=mem
  '';
}
