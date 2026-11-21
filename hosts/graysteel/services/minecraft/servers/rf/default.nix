{ pkgs, ... }:
let
  modpack = pkgs.fetchModrinthModpack {
    url = "https://asphodel.cc/resources/cf/Raspberry-Flavoured-3.3.1-Server-Pack.mrpack";
    packHash = "sha256-8Ulaw/gUrBdKwMHZS1P+Yhhl92SaAA3QnmBdDPpGNBU=";
  };
in
{
  services.minecraft-servers.servers.rf = {
    enable = true;
    jvmOpts = "-Xms6860m -Xmx6860m -XX:+AlwaysPreTouch -XX:+DisableExplicitGC";
    package = pkgs.callPackage ./forge.nix { };
    serverProperties = {
      difficulty = 3;
      level-seed = "-6421977643854912028";
      motd = "Now with Verity!";
      online-mode = false;
      spawn-protection = 0;
    };
    symlinks = {
      "mods" = "${modpack}/mods";
    };
    files = {
      "config" = "${modpack}/config";
      "kubejs" = "${modpack}/kubejs";
    };
  };
}
