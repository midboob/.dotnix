{ config, lib, ... }:

{
  xdg.configFile."startpage" = {
    source = ./startpage;
    recursive = true;
  };
}
