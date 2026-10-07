{ pkgs, ... }: {
  imports = [
    ./impermanence.nix
    ./networking.nix
    ./locale.nix
    ./nix-settings.nix
    ./sops.nix
  ];

  environment.systemPackages = [ pkgs.e2fsprogs ];
}
