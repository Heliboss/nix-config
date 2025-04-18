{
  inputs,
  ...
}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".local/share/flatpak"
      ".var/app"
    ];
  };

  services.flatpak.packages = [
    "org.vinegarhq.Sober"
    "net.davidotek.pupgui2"
  ];
}
