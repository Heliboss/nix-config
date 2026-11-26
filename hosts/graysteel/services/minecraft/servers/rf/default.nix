{ lib, pkgs, ... }:
let
  modpack = pkgs.fetchModrinthModpack {
    url = "https://asphodel.cc/resources/cf/Raspberry-Flavoured-3.3.1-Server-Pack.mrpack";
    packHash = "sha256-8Ulaw/gUrBdKwMHZS1P+Yhhl92SaAA3QnmBdDPpGNBU=";
  };
  extras = pkgs.fetchPackwizModpack {
    src = ./extras;
    packHash = "sha256-HxV/j6tHnCVVLnTeFbW7sKZxTqNa4lqe1f2HXuS4VkE=";
  };
  modpack-with-extras = pkgs.runCommand "modpack-with-extras" { } ''
    mkdir -p $out/mods
    cp -r ${modpack}/mods/. $out/mods
    cp -r ${extras}/mods/. $out/mods
  '';
  json5 = { }: {
    type = lib.types.attrs;
    generate = name: value: pkgs.writeText name (builtins.toJSON value);
  };
in
{
  services.minecraft-servers.servers.rf = {
    enable = true;
    jvmOpts = "-Xms6860m -Xmx6860m -XX:+AlwaysPreTouch -XX:+DisableExplicitGC";
    package = pkgs.callPackage ./forge.nix { };
    serverProperties = {
      allow-flight = true;
      difficulty = 3;
      level-seed = "-83849377387518384";
      motd = "Now with Verity!";
      online-mode = false;
      simulation-distance = 6;
      spawn-protection = 0;
      view-distance = 6;
    };
    symlinks = {
      "mods" = "${modpack-with-extras}/mods";
    };
    files = {
      "config" = "${modpack}/config";
      "config/simplewhitelist/whitelist.txt".value = [
        "@whitelist@"
      ];
      "config/voicechat/voicechat-server.properties".value = {
        voice_host = "@voice_host@";
      };
      "config/worldborder.json5" = {
        format = json5 { };
        value = {
          enableCustomOverworldBorder = false;
          enableCustomeNetherBorder = true;
          shouldLoopToOppositeBorder = false;
          netherBorderPositiveX = 959;
          netherBorderNegativeX = -1040;
          netherBorderPositiveZ = 1009;
          netherBorderNegativeZ = -990;
        };
      };
      "kubejs" = "${modpack}/kubejs";
    };
  };
}
