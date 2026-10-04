{ pkgs, ... }:
{
  imports = [
    ./opentabletdriver
    ./obs.nix
    ./krita
    ./gimp.nix
    ./blender.nix
    ./synthv
    ./openutau.nix
  ];

  home.packages = with pkgs; [
    kdePackages.kdenlive
    reaper
    ffmpeg-full
    yt-dlp
  ];

  home.persistence."/persist" = {
    directories = [
      ".lv2"
      ".vst3"
    ];
  };
}
