{ config, pkgs, ... }: {
  # Optimizations
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "ntsync" ];
  boot.kernelParams = [
    "mitigations=off"     # Security/performance trade-off (~5% gain)
    "amd_pstate=active"   # For Zen 2+ CPUs
  ];
  powerManagement.cpuFreqGovernor = "performance";
}
