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
    ".config/gtk-2.0" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/gtk-2.0";
      force = true;
    };
    ".config/gtk-3.0" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/gtk-3.0";
      force = true;
    };
    ".config/gtk-4.0" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/gtk-4.0";
      force = true;
    };
  };

  home.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
    QT_STYLE_OVERRIDE = "Adwaita-Dark";
  };
}
