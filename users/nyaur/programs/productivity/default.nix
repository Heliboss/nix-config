{
  pkgs,
  ...
}: {
  imports = [
    ./libreoffice.nix
    ./pandoc.nix
    ./texlive.nix
  ];
}
