{ config, lib, ... }:

{
  xdg.configFile."hellwal" = {
    source = ./hellwal;
    recursive = true;
  };
}
