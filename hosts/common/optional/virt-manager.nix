{
  pkgs,
  ...
}: {
  programs.virt-manager.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = [ pkgs.virtiofsd ];
  };

  environment.persistence."/persist" = {
    directories = [
      "/var/lib/libvirt"
      "/var/lib/qemu"
    ];
  };
}
