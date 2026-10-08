{ inputs, ... }:
{
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
    ./tot
  ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
  };
}
