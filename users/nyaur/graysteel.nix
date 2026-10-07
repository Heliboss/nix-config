{ pkgs, flake, ... }:
{
  imports = [
    ./programs/cli/nh.nix
    ./programs/cli/neovim
    ./programs/cli/git.nix
    ./programs/cli/yazi
  ];

  home.packages = with pkgs; [
    sops
  ];

  home.sessionVariables = {
    FLAKE = flake;
  };

  # Don't change
  home.stateVersion = "26.05";
}
