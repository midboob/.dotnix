{
  config,
  pkgs,
  ...
}: {
  # Mounting additional drives
  fileSystems = {
    "/mnt/Storage" = {
      device = "/dev/disk/by-uuid/9A62A5A562A5871B";
      fsType = "ntfs3";
      options = ["rw" "uid=1000" "gid=100" "dmask=022" "fmask=133" "exec"];
    };

    # "/mnt/Windows" = {
    #   device = "/dev/disk/by-uuid/01DC3DED727A8D90";
    #   fsType = "ntfs-3g";
    #   options = ["rw" "uid=1000" "gid=100" "dmask=022" "fmask=133"];
    # };
  };
}
