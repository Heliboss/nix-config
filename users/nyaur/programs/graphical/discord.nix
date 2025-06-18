{
  programs.vesktop = {
    enable = true;
  };

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".config/vesktop"
    ];
  };
}
