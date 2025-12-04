{
  pkgs,
  config,
  ...
}: let
  swayStatus = pkgs.writeShellScript "sway-status" ''
    while :; do
      date +"%a %b %d  %l:%M %p"
      sleep 1
    done
  '';
in {
  wayland.windowManager.sway.config.bars = [
    (
      {
        position = "top";

        statusCommand = "${swayStatus}";
      }
      // config.stylix.targets.sway.exportedBarConfig
    )
  ];
}
