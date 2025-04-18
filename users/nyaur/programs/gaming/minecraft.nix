{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    prismlauncher
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".local/share/PrismLauncher"
    ];
  };
}
