{
  pkgs,
  ...
}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".config/obs-studio"
    ];
  };
}
