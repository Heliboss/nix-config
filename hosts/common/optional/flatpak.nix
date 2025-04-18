{
  pkgs,
  ...
}: {
  environment.persistence."/persist" = {
    directories = [
      "/var/lib/flatpak"
    ];
  };

  services.flatpak.enable = true;

  xdg.portal.enable = true;
}
