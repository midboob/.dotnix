{pkgs, ...}: {
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";

    BROWSER = "${pkgs.brave}/bin/brave";
    DEFAULT_BROWSER = "${pkgs.brave}/bin/brave";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Brave
      "application/xhtml+xml" = "brave-browser.desktop";
      "text/html" = "brave-browser.desktop";
      "text/xml" = "brave-browser.desktop";
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";

      # Eog
      "image/png" = "org.gnome.eog.desktop";
      "image/jpeg" = "org.gnome.eog.desktop";
      "image/jpg" = "org.gnome.eog.desktop";
      "image/gif" = "org.gnome.eog.desktop";
      "image/bmp" = "org.gnome.eog.desktop";
      "image/svg+xml" = "org.gnome.eog.desktop";

      # Mpv
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "audio/mpeg" = "mpv.desktop";
      "audio/ogg" = "mpv.desktop";
      "audio/wav" = "mpv.desktop";

      # Nautilus
      "inode/directory" = "org.gnome.Nautilus.desktop";

      # Zathura
      "application/pdf" = "org.pwmt.zathura.desktop";
    };
  };
}
