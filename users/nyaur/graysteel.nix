{ pkgs, ... }:
let
  FLAKE = "/etc/nixos/nix-config";
in
{
  imports = [
    ./programs/cli/neovim
    ./programs/cli/git.nix
    ./programs/cli/yazi
  ];

  programs = {
    nh.enable = true;
  };

  home.packages = with pkgs; [
    sops
  ];

  home.sessionVariables = {
    inherit FLAKE;
    NH_FLAKE = FLAKE;
  };

  # Don't change
  home.stateVersion = "26.05";
}
