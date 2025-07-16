{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    prismlauncher-unwrapped
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".local/share/PrismLauncher"
    ];
  };
}
