{ config, inputs, ... }:
{
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
    ./servers/tot
    ./servers/rf
  ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  sops.secrets.voice-host = { };

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    environmentFile = config.sops.secrets.voice-host.path;
  };
}
