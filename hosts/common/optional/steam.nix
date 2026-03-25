{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamemode
      # For SynthV zenity fix
      kdePackages.kdialog
    ];
    gamescopeSession.enable = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };

  # Workaround since apparently CAP_SYS_NICE prevents gamescope from working in Steam
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-cpp;
    extraRules = [{
      "name" = "gamescope";
      "nice" = -20;
    }];
  };
}
