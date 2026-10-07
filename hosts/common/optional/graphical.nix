{ config, ... }: {
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true; # Replaces LightDM with TTY login prompt
  };

  security.rtkit.enable = true; # Ensures realtime priority for Pipewire
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
    extraConfig.pipewire = {
      "10-clock-rate"."context.properties"."default.clock.rate" = 44100;
    };
  };

  security.polkit.enable = true;
  hardware.graphics.enable = true;
  programs.dconf.enable = true;
  fonts.fontDir.enable = true;

  # Don't shut down on power button short press
  services.logind.settings.Login = {
    HandlePowerKey = "ignore";
  };

  # Enable SysRq shortcuts
  boot.kernel.sysctl."kernel.sysrq" = 1;

  xdg.portal = {
    extraPortals = config.home-manager.users.nyaur.xdg.portal.extraPortals;
    config.common.default = config.home-manager.users.nyaur.xdg.portal.config.common.default;
  };

}
