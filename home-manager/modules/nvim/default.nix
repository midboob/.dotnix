{ config, lib, ... }:

{
  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
