{inputs, ...}: {

  imports = [
    inputs.matugen.nixosModules.default
  ];

  programs.matugen = {
    enable = false;
    variant = "dark";
    jsonFormat = "hex";

    templates = {
      # kittty = {
      #   input_path = "./templates/kitty.conf";
      #   output_path = "~/.config/kitty/colors.conf";
      # };
      #
      # hypr = {
      #   input_path = "./templates/hypr.conf";
      #   output_path = "~/.config/hypr/colors.conf";
      # };

      yazi = {
        input_path = "./templates/matugen-yazi.toml";
        output_path = "~/.config/yazi/theme.toml";
      };
    };
  };
}
