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
    servers = {
      fabric = {
        enable = true;
        autoStart = true;
        jvmOpts = "-Xmx12G -Xms2G";

        package = pkgs.fabricServers.fabric-1_21_11.override {
          loaderVersion = "0.18.4";
        };

        symlinks = {
          mods = ./mods;
          datapacks = ./datapacks;
        };

        operators = {
          blangebob = "4a3ae14d-62aa-4b6e-b381-0ebb0708569a";
        };

        serverProperties = {
          server-port = 12345;
          difficulty = 3;
          gamemode = 1;
          max-players = 20;
          motd = "poopy buthole";
          level-name = "poopy buthole";
        };
      };
      vanilla = {
        enable = true;
        autoStart = true;
        jvmOpts = "-Xmx12G -Xms2G";
        package = pkgs.minecraftServers.vanilla-1_21_11;

        operators = {
          blangebob = "4a3ae14d-62aa-4b6e-b381-0ebb0708569a";
        };

        serverProperties = {
          server-port = 25565;
          difficulty = 3;
          gamemode = 1;
          max-players = 20;
          motd = "poopy buthole 67";
          level-name = "12324";
        };
      };
    };
  };
}
