{ pkgs, ... }: {
  services.minecraft-servers.servers.tot = {
    enable = true;
    jvmOpts = "-Xmx4G -Xms2G";
    package = pkgs.neoforgeServers.neoforge-1_21_1;
  };
}
