{ pkgs, ... }:

let
  RARS = ./myapp.jar;
in {
  home.packages = [
    (pkgs.writeShellScriptBin "RARS" ''
      exec ${pkgs.jre}/bin/java -jar ${RARS} "$@"
    '')
  ];

xdg.desktopEntries.myapp = {
  name = "RARS 1.55";
  comment = "My Java application";
  exec = "myapp";
  terminal = false;
  categories = [ "Utility" ];
};


}
