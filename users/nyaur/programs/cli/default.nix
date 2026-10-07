{ pkgs, ... }:
{
  imports = [
    ./nh.nix
    ./btop
    ./neovim
    ./fastfetch
    ./fish
    ./ttyper
    ./git.nix
    ./yazi
    ./jrnl
  ];

  home.packages = with pkgs; [
    android-file-transfer
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
