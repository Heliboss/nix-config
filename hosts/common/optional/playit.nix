{ inputs, ... }: {
  imports = [ inputs.playit-nixos-module.nixosModules.default ];
  services.playit = {
    enable = true;
    secretPath = "/etc/nixos/playit.toml";
  };
}
