{
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
  };

  security.polkit.enable = true;
  hardware.graphics.enable = true;
  programs.dconf.enable = true;
  fonts.fontDir.enable = true;

  # Don't shut down on power button short press
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
  '';

  # Enable SysRq shortcuts
  boot.kernel.sysctl."kernel.sysrq" = 1;
}
