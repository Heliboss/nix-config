{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.fastanime.packages.${pkgs.system}.default
  ];
}
