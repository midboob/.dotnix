{ pkgs, ... }: {
	programs.waybar.settings.mainBar = {

		# Base
		layer = "top";
		position = "top";
		height = 28;
    margin-top = 5;
    margin-bottom = 0;
    margin-left = 5;
    margin-right = 5;
		ipc = true;

		# Placement
		modules-left = [
			"hyprland/workspaces"
		];

		modules-center = [
			"clock"
		];

		modules-right = [
      "tray"
			"custom/spacer"
      "backlight"
      "battery"
			"pulseaudio"
			"custom/spacer"
			"custom/notification"
		];

		# Modules
		"custom/spacer" = {
			tooltip = false;
			format = "|";
		};

    "pulseaudio" =  {
      format = "<b>{volume}%</b> {icon} ";
      format-muted = " 󰝟 ";
      format-bluetooth = "<b>{volume}%</b> {icon} ";
      format-bluetooth-muted = "󰝟 ";
      format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = [
          "󰕿"
          "󰖀"
          "󰕾"
        ];
      };
    };

    "backlight" = {
      format = "{icon} <b>{percent}%</b> | ";
      format-icons =  [
        "󰃞"
        "󰃟"
        "󰃠"
      ];
      tooltip =  false;
    };

    "tray" = {
      icon-size = 15;
      spacing = 5;
    };

    "battery" = {
      format = "{icon} {capacity}% | ";
      format-plugged = " {capacity}% | ";
      format-icons = [
        ""
        ""
        ""
        ""
        ""
      ];
      max-length = 25;
      tooltip = true;
      interval = 5;
      states = {
        good = 70;
        warning = 30;
        critical = 1;
      };
    };

		# Hyprland modules
    "hyprland/workspaces" = {
      all-outputs = true;
      format = "{name}";
      on-scroll-up = "hyprctl dispatch workspace e+1 1>/dev/null";
      on-scroll-down = "hyprctl dispatch workspace e-1 1>/dev/null";
      sort-by-number = true;
      active-only = false;
    };

		# Base modules
		"clock" = {
			interval = 60;
			format = "{:%m/%d %I:%M}";
			tooltip = false;
		};

		# Notificaions
		"custom/notification" = {
			tooltip = false;
			format = "{} {icon} ";
			format-icons = {
				notification = "<span foreground='red'><sup></sup></span>";
				none = "";
				dnd-notification = "<span foreground='red'><sup></sup></span>";
				dnd-none = "";
				inhibited-notification = "<span foreground='red'><sup></sup></span>";
				inhibited-none = "";
				dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
				dnd-inhibited-none = "";
			};
			return-type = "json";
			exec-if = "which swaync-client";
			exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
			on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
			on-click-right = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
			escape = true;
		};
	};
}
