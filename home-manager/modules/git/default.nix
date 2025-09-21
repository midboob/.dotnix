{ pkgs, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.git.override { withLibsecret = true; };

    userName = "midboob";
    userEmail = "edwarddan72@gmail.com";

    extraConfig = {

      credential.helper = "libsecret";

      core = {
        compression = 9;
        editor = "nvim";
        whitespace = "error";
      };

      init.defaultBranch = "main";

      status = {
        branch = true;
        short = true;
        showStash = true;
        showUntrackedFiles = "all";
      };

      diff = {
        context = 3;
        renames = "copies";
      };

      log = {
        abbrevCommit = true;
        graphColors = "blue,yellow,cyan,magenta,green,red";
      };

      safe = {
        # one or more explicit paths
        directory = [
          "/mnt/Storage/Documents/notes"
        ];
      };

      commit = {
        template = "${./template}";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
      hosts = [ "https://github.com" "https://gist.github.com" ];
    };
  };
}
