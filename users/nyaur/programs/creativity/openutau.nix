{ pkgs, ... }:
{
  home.packages = with pkgs; [
    openutau
  ];

  home.persistence."/persist" = {
    directories = [
      ".local/share/OpenUtau"
    ];
  };
}
