{ pkgs, inputs, ... }: {
  imports = [
    ./btop
    ./neovim
    ./fastfetch.nix
    ./fish
    ./ttyper
    ./devenv.nix
    ./git.nix
    ./yazi.nix
    ./modprobed-db.nix
    ./fastanime.nix
    ./yt-x
  ];

  programs = { nh.enable = true; };

  home.packages = with pkgs; [
    jmtpfs
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
    directories = [ ".ssh" ".gnupg" ];
  };
}
