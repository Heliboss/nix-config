{
  services.zerotierone.enable = true;

  environment.persistence."/persist" = {
    directories = [
      "/var/lib/zerotier-one"
    ];
  };
}
