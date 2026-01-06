{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nix-minecraft.nixosModules.minecraft-servers];
  nixpkgs.overlays = [inputs.nix-minecraft.overlay];

  environment.systemPackages = with pkgs; [
    prismlauncher
    jdk8
    jdk21
  ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers.fabric = {
      enable = true;
      package = pkgs.fabricServers.fabric-1_21_10.override {
        loaderVersion = "0.18.4";
      }; 
      symlinks = {
        mods = ./mods;
      };
    };
    servers.vanilla = {
      enable = false;
      jvmOpts = "-Xmx12G -Xms2G";

      # Specify the custom minecraft server package
      package = pkgs.minecraftServers.vanilla-1_21_11;
    };
  };
}
