{ pkgs, ... }: {
  home.packages = with pkgs; [ libreoffice ];

  home.persistence."/persist" = {
    directories = [ ".config/libreoffice" ];
  };
}
