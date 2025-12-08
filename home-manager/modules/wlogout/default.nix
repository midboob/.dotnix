{
  config,
  pkgs,
  ...
}: {
  home.file.".config/wlogout/icons".source = ./icons; # path in your flake/dotfiles

  fonts.fontconfig.enable = true;
  programs.wlogout = {
    enable = true;

    # The layout file: each entry corresponds to a button
    layout = [
      {
        label = "lock";
        action = "hyprlock"; # replace with your locker
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "sleep";
        action = "systemctl suspend";
        text = "Sleep";
        keybind = "s";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "p";
      }
    ];

    # CSS theme for wlogout
    style = ''
      window {
          font-family: GeistMono Nerd Font Propo;
          font-size: 16pt;
          color: @foreground; /* use themed text color */
          background-color: @surface-alpha;
      }

      button {
          background-repeat: no-repeat;
          background-position: center;
          background-size: 20%;
          background-color: transparent;
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.3s ease-in;
          box-shadow: 0 0 10px 2px transparent;
          border: none;
          border-radius: 36px;
          margin: 10px;
          text-shadow: none;
      }


      button:focus {
          box-shadow: none;
          outline-style: none;
          background-size : 20%;
      }

      button:hover {
          background-size: 50%;
          outline-style: none;
          box-shadow: 0 0 10px 3px rgba(0,0,0,.4);
          background-color: @primary;
          color: transparent;
          text-shadow: none;
          transition: all 0.3s cubic-bezier(.55, 0.0, .28, 1.682), box-shadow 0.5s ease-in;
      }

      #shutdown {
          background-image: image(url("./icons/power.png"));
      }
      #shutdown:hover {
        background-image: image(url("./icons/power-hover.png"));
      }

      #logout {
          background-image: image(url("./icons/logout.png"));

      }
      #logout:hover {
        background-image: image(url("./icons/logout-hover.png"));
      }

      #reboot {
          background-image: image(url("./icons/restart.png"));
      }
      #reboot:hover {
        background-image: image(url("./icons/restart-hover.png"));
      }

      #lock {
          background-image: image(url("./icons/lock.png"));
      }
      #lock:hover {
        background-image: image(url("./icons/lock-hover.png"));
      }

      #sleep {
          background-image: image(url("./icons/sleep.png"));
      }
      #sleep:hover {
        background-image: image(url("./icons/sleep-hover.png"));
      }

      #hibernate {
        background-image: image(url("./icons/hibernate.png"));
      }

      #hibernate:hover {
        background-image: image(url("./icons/hibernate-hover.png"));
      }
    '';
  };
}
