{ pkgs, ... }: {
  home.packages = with pkgs; [ pavucontrol ];

  home.persistence."/persist" = {
    directories = [ ".local/state/wireplumber" ];
  };

  xdg.desktopEntries = {
    "org.pulseaudio.pavucontrol" = {
      name = "Volume Control";
      exec = "env GTK_THEME=Adwaita-dark pavucontrol %U";
    };
  };
}
