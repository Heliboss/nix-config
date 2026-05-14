{
  utils,
  ...
}:
{
  imports = [
    ./disk-config.nix
  ];

  # Declare the password!!! >:(
  users.mutableUsers = false;

  boot.initrd.systemd = {
    enable = true;
    services.impermanence = {
      description = "Move root subvolume to /dev/root/mapper/old_roots on boot and delete after 30d";
      unitConfig.DefaultDependencies = false;
      serviceConfig.Type = "oneshot";
      requiredBy = [ "initrd.target" ];
      before = [ "sysroot.mount" ];
      requires = [ "${utils.escapeSystemdPath "/dev/mapper/root"}.device" ];
      after = [
        "${utils.escapeSystemdPath "/dev/mapper/root"}.device"
        "local-fs-pre.target"
      ];
      # Also deletes /var/lib/libvirt/secrets/secrets-encryption-key to prevent an error
      script = ''
        mkdir /btrfs_tmp
        mount /dev/mapper/root /btrfs_tmp
        if [[ -e /btrfs_tmp/root ]]; then
            mkdir -p /btrfs_tmp/persist/old_roots
            timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
            mv /btrfs_tmp/root "/btrfs_tmp/persist/old_roots/$timestamp"
        fi

        delete_subvolume_recursively() {
            IFS=$'\n'
            for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
                delete_subvolume_recursively "/btrfs_tmp/$i"
            done
            btrfs subvolume delete "$1"
        }

        for i in $(find /btrfs_tmp/persist/old_roots/ -mindepth 1 -maxdepth 1 -mtime +30); do
            delete_subvolume_recursively "$i"
        done

        rm /btrfs_tmp/persist/var/lib/libvirt/secrets/secrets-encryption-key
        btrfs subvolume create /btrfs_tmp/root
        umount /btrfs_tmp
      '';
    };
  };
}
