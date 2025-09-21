{ config, lib, ... }:

{
  xdg.configFile."mpv" = {
    source = ./mpv;
    recursive = true;
  };
}
