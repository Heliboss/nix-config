{
  pkgs,
  ...
}: {
  programs.virt-manager.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = [ pkgs.virtiofsd ];
  };

  networking.firewall.trustedInterfaces = [
    "virbr0"
  ];

  environment.persistence."/persist" = {
    directories = [
      "/var/lib/libvirt"
      "/var/lib/qemu"
    ];
  };
}
