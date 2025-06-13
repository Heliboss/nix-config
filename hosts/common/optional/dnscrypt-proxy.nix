{
  networking = {
    networkmanager.dns = "none";
    nameservers = [ "127.0.0.1" "::1" ];
  };

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      server_names = [
        "controld-block-malware-ad"
      ];
      ipv6_servers = true;
      http3 = true;
    };
  };
}
