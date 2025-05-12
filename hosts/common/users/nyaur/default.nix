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
    "d /persist/home/nyaur/.local 0700 nyaur users -"
    "d /persist/home/nyaur/.local/share 0700 nyaur users -"
    # Sometimes fixes symlinks created by impermanence
    # Some programs may still error with something like "mkdir: could not create file, file exists"
    # If so, just rm -r the symlink, run the program, mv the created directory into /persist, then rebuild. Can't think of a more elegant solution
    "d /persist/home/nyaur/.local/state 0700 nyaur users -"
    "d /persist/home/nyaur/.config 0700 nyaur users -"
    "d /persist/home/nyaur/.var 0700 nyaur users -"
    "d /persist/home/nyaur/.local/share/Steam 0700 nyaur users -"
    "d /persist/home/nyaur/Downloads 0700 nyaur users -"
    "d /persist/home/nyaur/Music 0700 nyaur users -"
    "d /persist/home/nyaur/Pictures 0700 nyaur users -"
    "d /persist/home/nyaur/Documents 0700 nyaur users -"
    "d /persist/home/nyaur/Videos 0700 nyaur users -"
    "d /persist/home/nyaur/Games 0700 nyaur users -"
    "d /persist/home/nyaur/Applications 0700 nyaur users -"
    "d /persist/home/nyaur/Source 0700 nyaur users -"
    "d /persist/home/nyaur/Projects 0700 nyaur users -"
    "d /persist/home/nyaur/Public 0700 nyaur users -"
    "d /persist/home/nyaur/.config/nixos 0700 nyaur users -"
    "d /persist/home/nyaur/.local/share/devenv 0700 nyaur users -"
    "d /persist/home/nyaur/.local/share/nvim 0700 nyaur users -"
    "d /persist/home/nyaur/.local/state/nvim 0700 nyaur users -"
    "d /persist/home/nyaur/.local/share/krita 0700 nyaur users -"
    "d /persist/home/nyaur/.config/obs-studio 0700 nyaur users -"
    "d /persist/home/nyaur/.local/share/flatpak 0700 nyaur users -"
    "d /persist/home/nyaur/.var/app 0700 nyaur users -"
    "d /persist/home/nyaur/.local/share/lutris 0700 nyaur users -"
    "d /persist/home/nyaur/.local/share/osu 0700 nyaur users -"
    "d /persist/home/nyaur/.local/state/wireplumber 0700 nyaur users -"
    "d /persist/home/nyaur/.config/libreoffice 0700 nyaur users -"
    "d /persist/home/nyaur/.local/share/anime-game-launcher 0700 nyaur users -"
    "f /persist/home/nyaur/.config/modprobed.db 0700 nyaur users -"
    "f /persist/home/nyaur/.config/modprobed-db.conf 0700 nyaur users -"
    "f /persist/home/nyaur/.config/kritarc 0700 nyaur users -"
    "f /persist/home/nyaur/.config/kritadisplayrc 0700 nyaur users -"
    "d /persist/home/nyaur/.local/share/PrismLauncher 0700 nyaur users -"
    "d /persist/home/nyaur/.ssh 0700 nyaur users -"
    "d /persist/home/nyaur/.gnupg 0700 nyaur users -"
    "d /persist/home/nyaur/.local/share/qBittorrent 0700 nyaur users -"
    "d /persist/home/nyaur/.config/bitburner 0700 nyaur users -"
    "d /persist/home/nyaur/.config/NecroDancer 0700 nyaur users -"
  ];

  # Gets freaky when putting this in the home manager module. Maybe a permission issue?
  environment.persistence."/persist" = {
    directories = [
      "/home/nyaur/.local/share/waydroid"
    ];
  };

  home-manager = {
    users.nyaur = (import ../../../../users/nyaur/${config.networking.hostName}.nix { inherit config pkgs inputs; }); # Fix infinite recursion
    backupFileExtension = "backup";
  };
}
