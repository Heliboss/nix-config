{
  config,
  ...
}: {
  dconf = {
    settings."org/gnome/desktop/interface" = {
      gtk-theme = "Adwaita";
      color-scheme = "prefer-dark";
    };
  };

  home.file = {
    ".config/gtk-2.0/gtkrc".text = ''
      gtk-application-prefer-dark-theme = 1
    '';
    ".config/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme = 1
    '';
    ".config/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme = 1
    '';
  };

  home.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
    QT_STYLE_OVERRIDE = "Adwaita-Dark";
  };
}
