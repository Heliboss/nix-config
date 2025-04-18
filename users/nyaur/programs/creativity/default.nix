{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./obs.nix
    ./krita.nix
    ./gimp.nix
  ];

  home.packages = with pkgs; [
    kdePackages.kdenlive
    reaper
    ffmpeg-full
    yt-dlp
  ];

  home.file = {
    ".config/OpenTabletDriver/Presets".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/OpenTabletDriver/Presets";
  };
}
