{ pkgs, ... }: {

	stylix.targets.hyprlock.enable = true;
  programs.hyprlock = {
    enable = true;

    settings = {
      background = [
        {
          monitor = "";
          path = "$image";
          blur_size = 5;
          blur_passes = 3;
          brightness = 0.6;
        }
      ];

      "input-field" = [
        {
          monitor = "";
          size = "6%, 4%";
          outline_thickness = 0;
          dots_rounding = 4;
          dots_spacing = 0.5;
          dots_fade_time = 300; # was dots_fase_time
          inner_color = "$surface";
          outer_color = "$surface $surface";
          check_color = "$primary $primary";
          fail_color = "$error $error";
          font_color = "$on_primary";
          font_family = "CodeNewRoman Nerd Font Propo";
          fade_on_empty = false;
          shadow_color = "rgba(0,0,0,0.5)";
          shadow_passes = 2;
          shadow_size = 2;
          rounding = 20;
          placeholder_text = "<i></i>";
          fail_text = "<b>FAIL</b>";
          fail_timeout = 100;
          position = "0, -100";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] date +"<b>%I</b>"'';
          color = "$on_primary";
          font_size = 200;
          font_family = "CodeNewRoman Nerd Font Propo";
          shadow_passes = 0;
          shadow_size = 5;
          position = "-120, 410";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] date +"<b>%M</b>"'';
          color = "rgba(150,150,150,.4)";
          font_size = 200;
          font_family = "CodeNewRoman Nerd Font Propo";
          shadow_passes = 0;
          shadow_size = 5;
          position = "120, 230";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] date +"<b>%A, %B %d, %Y</b>"'';
          color = "$secondary";
          font_size = 40;
          font_family = "CodeNewRoman Nerd Font Propo";
          shadow_passes = 0;
          shadow_size = 4;
          position = "-40, -20";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "<i>Hello</i> <b>$USER</b>";
          color = "$tertiary";
          font_size = 40;
          font_family = "CodeNewRoman Nerd Font Propo";
          shadow_passes = 0;
          shadow_size = 4;
          position = "40, -20";
          halign = "left";
          valign = "top";
        }
      ];
    };
  };
}
