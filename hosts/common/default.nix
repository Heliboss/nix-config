{
  imports = [
    ./impermanence.nix
    ./networking.nix
    ./locale.nix
    ./nix-settings.nix
    ./sops.nix
  ];

  zramSwap.enable = true;
}
