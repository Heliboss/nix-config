{
  pkgs,
  ...
}: {
  imports = [
    ./libreoffice.nix
    ./pandoc.nix
  ];

  home.packages = with pkgs; [
    texlive.combined.scheme-full
  ];
}
