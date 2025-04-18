{
  programs.wofi.enable = true;

  home.persistence."/persist/home/nyaur" = {
    files = [
      "/.cache/wofi-drun"
    ];
  };
}
