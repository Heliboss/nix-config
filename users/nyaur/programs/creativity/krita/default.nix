{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    krita
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".local/share/krita"
    ];
    files = [
      ".config/kritarc"
      ".config/kritadisplayrc"
    ];
  };

  home.file = {
    ".config/kritashortcutsrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/creativity/krita/kritashortcutsrc";

  };
}
