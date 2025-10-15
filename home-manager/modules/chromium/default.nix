{
  pkg,
  lib,
  config,
  ...
}: {
  # stylix.targets.chromium.enable = true;

  programs.chromium = {
    enable = true;
    extensions = [
      {id = "cndibmoanboadcifjkjbdpjgfedanolh";} # better canvas
      {id = "fcjmgeodgobggcppooncdagfkogfffdm";} # imagus reborn
      {id = "edibdbjcniadpccecjdfdjjppcpchdlm";} # i still dont care about cookies
      {id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp";} # privacy badger
      {id = "hlepfoohegkhhmjieoechaddaejaokhf";} # refined github
      {id = "kabafodfnabokkkddjbnkgbcbmipdlmb";} # tasks for canvas
      {id = "khncfooichmfjbepaaaebmommgaepoid";} # unhook for youtube
      {id = "ihgeijoonjmdfkamhpgoedplnmbencgd";} # UnInternet
      {id = "dbepggeogbaibhgnhhndojpepiihcmeb";} # vimium
      {id = "oldceeleldhonbafppcapldpdifcinji";} # ai grammer checker
    ];
    # homepageLocation = "file:///home/edward/.config/startpage/index.html";
  };
}
