{ pkgs, ... }: {
  home.packages = with pkgs; [ blender ];

  home.persistence."/persist/home/nyaur" = {
    directories = [ ".config/blender" ];
  };
}
