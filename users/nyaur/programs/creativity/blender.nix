{ pkgs, ... }: {
  home.packages = with pkgs; [ blender ];

  home.persistence."/persist" = { directories = [ ".config/blender" ]; };
}
