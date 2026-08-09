{ pkgs, inputs, ... }:
{
  imports = [
    ./btop
    ./neovim
    ./fastfetch
    ./fish
    ./ttyper
    ./devenv.nix
    ./git.nix
    ./yazi
    ./modprobed-db.nix
  ];

  programs = {
    nh.enable = true;
  };

  home.packages = with pkgs; [
    simple-mtpfs
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

  home.persistence."/persist" = {
    directories = [
      ".ssh"
      ".gnupg"
    ];
  };
}
