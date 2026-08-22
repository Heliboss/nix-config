{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vale
    vale-ls
  ];

  home.persistence."/persist" = {
    directories = [ ".local/share/vale" ];
  };
}
