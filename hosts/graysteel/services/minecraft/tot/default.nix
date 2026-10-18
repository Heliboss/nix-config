{ pkgs, ... }:
let
  modpack = (
    pkgs.fetchPackwizModpack {
      src = ./modpack;
      packHash = "sha256-BvNZf5tQnJ901PU8gxhuJMOoRoeuCatzifuLZlETPoI=";
    }
  );
in
{
  services.minecraft-servers.servers.tot = {
    enable = true;
    jvmOpts = "-Xms3G -Xmx3G -XX:+AlwaysPreTouch -XX:+DisableExplicitGC";
    package = pkgs.neoforgeServers.neoforge-1_21_1-21_1_256;
    serverProperties = {
      allow-flight = true;
      difficulty = 3;
      level-seed = "-1276853157668539701";
      motd = "Avanti, barbari!";
      online-mode = false;
      spawn-protection = 0;
      view-distance = 6;
    };
    symlinks = {
      "mods" = "${modpack}/mods";
    };
  };
}
