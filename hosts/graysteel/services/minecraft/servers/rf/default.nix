{ pkgs, ... }:
let
  modpack = pkgs.fetchModrinthModpack {
    url = "https://asphodel.cc/resources/cf/Raspberry-Flavoured-3.3.1-Server-Pack.mrpack";
    packHash = "sha256-8Ulaw/gUrBdKwMHZS1P+Yhhl92SaAA3QnmBdDPpGNBU=";
  };
  extras = pkgs.fetchPackwizModpack {
    src = ./extras;
    packHash = "sha256-X5lFvfPnHVMO2dgKMOT+x1LyPNTj8SIBP620rXsj+vc=";
  };
  modpack-with-extras = pkgs.runCommand "modpack-with-extras" { } ''
    mkdir -p $out/mods
    cp -r ${modpack}/mods/. $out/mods
    cp -r ${extras}/mods/. $out/mods
  '';
in
{
  services.minecraft-servers.servers.rf = {
    enable = true;
    jvmOpts = "-Xms6860m -Xmx6860m -XX:+AlwaysPreTouch -XX:+DisableExplicitGC";
    package = pkgs.callPackage ./forge.nix { };
    serverProperties = {
      difficulty = 3;
      level-seed = "-83849377387518384";
      motd = "Now with Verity!";
      online-mode = false;
      resource-pack = "https://cdn.modrinth.com/data/KxcF22pG/versions/Qo2dTR5E/ccc.zip";
      resource-pack-sha1 = "cf6cf368ade9e88a129e00d103d0e9a91a053da3";
      spawn-protection = 0;
      view-distance = 6;
      white-list = false;
    };
    symlinks = {
      "mods" = "${modpack-with-extras}/mods";
    };
    files = {
      "config" = "${modpack}/config";
      "kubejs" = "${modpack}/kubejs";
    };
  };
}
