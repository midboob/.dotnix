{ config, pkgs, ... }: {

  # Boot settings
	boot = {
    loader = {
      grub = {
        extraEntries = ''
          menuentry "Arch Linux (manual)" {
            insmod part_gpt
            insmod fat
            search --no-floppy --fs-uuid --set=root 3A75-2890
            linux /vmlinuz-linux root=UUID=b9c9d8e4-b049-4ac5-a48a-c0f7a1e96603 rw quiet
            initrd /initramfs-linux.img
            }
        '';
      };
    };
  };
  boot.supportedFilesystems = [ "ntfs" ];
}
