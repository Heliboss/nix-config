# Hosts folder should have a kernel config file <hostname>/kernel/.config
{
  config,
  pkgs,
  ...
}: let
  linux-tkg = pkgs.fetchFromGitHub {
    owner = "Frogging-Family";
    repo = "linux-tkg";
    rev = "dcf15eb";
    hash = "sha256-1/2Fz49hC3SiVY3ZxVJtfgTcXrz1SA3U6GHGiFcMCyA=";
  };
  major = "6";
  minor = "14";
  path = "${linux-tkg}/linux-tkg-patches/${major}.${minor}";
in {
  boot = {
    kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_14.override {
      configfile = ../../${config.networking.hostName}/kernel/.config;
    });
    kernelPatches = [
      {
        name = "clear-patches";
        patch = "${path}/0002-clear-patches.patch";
      }
      {
        name = "glitched-base";
        patch = "${path}/0003-glitched-base.patch";
      }
      {
        name = "glitched-pds";
        patch = "${path}/0005-glitched-pds.patch";
      }
      {
        name = "fsync_legacy";
        patch = "${path}/0007-v6.14-fsync_legacy_via_futex_waitv.patch";
      }
      {
        name = "misc-additions";
        patch = "${path}/0012-misc-additions.patch";
      }
      {
        name = "optimize-harder-O3";
        patch = "${path}/0013-optimize_harder_O3.patch";
      }
    ];
  };
}
