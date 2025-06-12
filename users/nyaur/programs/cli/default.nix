{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./extras.nix
    ./neovim.nix
    ./fastfetch.nix
    ./fish.nix
    ./ttyper.nix
    ./devenv.nix
    ./git.nix
    ./yazi.nix
    ./modprobed-db.nix
    (import ./yt-x.nix { inherit pkgs inputs; })
    (import ./fastanime.nix { inherit pkgs inputs; })
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
