{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" "pipe-operators" ];
    trusted-users = [ "nyaur" ];
  };

  nixpkgs.config.allowUnfree = true;

  nix.optimise = {
    automatic = true;
    dates = [ "05:00" ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
