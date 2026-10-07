{ pkgs, flake, ... }:
{
  imports = [
    ./default.nix
    ./programs/cli/nh.nix
    ./programs/cli/neovim
    ./programs/cli/git.nix
    ./programs/cli/yazi
  ];

  home.persistence."/persist".enable = false;

  home.packages = with pkgs; [
    sops
  ];

  home.sessionVariables = {
    FLAKE = flake;
  };

  # Don't change
  home.stateVersion = "26.05";
}
