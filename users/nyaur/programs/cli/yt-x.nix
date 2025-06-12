{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.yt-x.packages.${pkgs.system}.default
  ];
}
