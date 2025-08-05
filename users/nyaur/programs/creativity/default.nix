{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./obs.nix
    ./krita
    ./gimp.nix
  ];

  home.packages = with pkgs; [
    kdePackages.kdenlive
    reaper
    ffmpeg-full
    yt-dlp
  ];

  home.file = {
    ".config/OpenTabletDriver/Presets".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/creativity/OpenTabletDriver/Presets";
    ".config/OpenTabletDriver/Plugins".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/creativity/OpenTabletDriver/Plugins";
  };
}
