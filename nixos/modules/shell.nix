{pkgs, ...}: {
  environment.shells = with pkgs; [bashInteractive zsh];

  programs.zsh.enable = true;

  users = {
    users.edward.shell = pkgs.zsh;
    defaultUserShell = pkgs.zsh;
  };
}
