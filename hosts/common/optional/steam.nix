{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    # For SynthV zenity fix
    extraPackages = with pkgs; [ kdePackages.kdialog ];
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
}
