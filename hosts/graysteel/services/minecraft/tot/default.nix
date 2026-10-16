{ pkgs, ... }:
let
  modpack = (
    pkgs.fetchPackwizModpack {
      src = ./modpack;
      packHash = "sha256-Y7/bosSuFUlx2caiRgDE8QWWFSJOBWYsEDA384fHfyg=";
    }
  );
in
{
  services.minecraft-servers.servers.tot = {
    enable = true;
    jvmOpts = "-Xms3G -Xmx3G";
    package = pkgs.neoforgeServers.neoforge-1_21_1-21_1_256;
    serverProperties = {
      allow-flight = true;
      difficulty = 3;
      level-seed = "-1276853157668539701";
      motd = "Avanti, barbari!";
      online-mode = false;
      spawn-protection = 0;
    };
    symlinks = {
      "mods" = "${modpack}/mods";
    };
  };
}
