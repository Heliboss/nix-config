{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  sops.secrets.nyaur.neededForUsers = true;

  users.users.nyaur = {
    isNormalUser = true;
    initialPassword = "123";
    extraGroups = [ "wheel" "networkmanager" "gamemode" "libvirtd" ];
    hashedPasswordFile = config.sops.secrets.nyaur.path;
  };

  # Prevents an error when using the home-manager impermanence module.
  # https://www.youtube.com/watch?v=YPKwkWtK7l0 - pinned comment.
  # Prevents directories from being created with incorrect permissions
  systemd.tmpfiles.rules = [
    "d /persist/home/ 0777 root root -"
    "d /persist/home/nyaur 0700 nyaur users -"
    "d /persist/home/nyaur/.config 0700 nyaur users -"
    "d /persist/home/nyaur/.local 0700 nyaur users -"
    "d /persist/home/nyaur/.local/share 0700 nyaur users -"
    "d /persist/home/nyaur/.local/state 0700 nyaur users -"
    "d /persist/home/nyaur/.var 0700 nyaur users -"
  ] ++ map (x: "d /persist/home/nyaur/" + x.directory + " 0700 nyaur users -") config.home-manager.users.nyaur.home.persistence."/persist/home/nyaur".directories
    ++ map (x: "f /persist/home/nyaur/" + x + " 0700 nyaur users -") config.home-manager.users.nyaur.home.persistence."/persist/home/nyaur".files;

  # Gets freaky when putting this in the home manager module. Maybe a permission issue?
  environment.persistence."/persist" = {
    directories = [
      "/home/nyaur/.local/share/waydroid"
    ];
  };

  home-manager = {
    users.nyaur = (import ../../../../users/nyaur/${config.networking.hostName}.nix);
    backupFileExtension = "backup";
  };
}
