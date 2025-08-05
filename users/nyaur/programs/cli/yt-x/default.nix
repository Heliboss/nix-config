{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./yt-x.nix
  ];

  home.packages = with pkgs; [
    inputs.yt-x.packages.${pkgs.system}.default
  ];
}
