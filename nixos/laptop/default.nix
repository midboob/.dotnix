{ inputs, config, lib, ... }: {

  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s
  ];

  powerManagement = {
    enable = true;
    powertop.enable = true;
    };
  services = {
    thermald.enable = true;

    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        # CPU_MIN_PERF_ON_AC = 0;
        # CPU_MAX_PERF_ON_AC = 100;
        # CPU_MIN_PERF_ON_BAT = 0;
        # CPU_MAX_PERF_ON_BAT = 80;
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        STOP_CHARGE_THRESH_BAT0 = 95;

      };
    };

    power-profiles-daemon.enable = false;
    logind.lidSwitch = "suspend-then-hibernate";
    logind.powerKey = "hibernate";
    logind.powerKeyLongPress = "poweroff";
  };
  boot.kernelParams = ["mem_sleep_default=deep"];

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=30m
    SuspendState=mem
  '';
}
