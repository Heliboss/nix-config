{
  pkgs,
  ...
}: {
  imports = [
    ./neovim.nix
    ./fastfetch.nix
    ./fish.nix
    ./ttyper.nix
    ./devenv.nix
    ./git.nix
    ./yazi.nix
    ./modprobed-db.nix
  ];

  programs = {
    nh.enable = true;
  };

  home.packages = with pkgs; [
    jmtpfs
    btop
    unzip
    powertop
    gdu
    unrar
    p7zip
    scrcpy
    sops
    age
    picocrypt-cli
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".ssh"
      ".gnupg"
    ];
  };
}
