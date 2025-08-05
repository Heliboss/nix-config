{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./neovim
    ./fastfetch.nix
    ./fish
    ./ttyper
    ./devenv.nix
    ./git.nix
    ./yazi.nix
    ./modprobed-db.nix
    (import ./fastanime.nix { inherit pkgs inputs; })
    (import ./yt-x { inherit pkgs inputs; })
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
