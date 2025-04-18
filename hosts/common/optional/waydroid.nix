{
  virtualisation.waydroid.enable = true;

  environment.persistence."/persist" = {
    directories = [
      "/var/lib/waydroid"
      "/etc/waydroid-extra"
    ];
  };
}
