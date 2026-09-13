{ config, ... }:
{
  xdg.desktopEntries.synthv = {
    name = "Synthesizer V Studio Basic";
    exec = "./Applications/synthesizer-v-studio-basic/start.sh %U";
  };

  home.file = {
    "Applications/synthesizer-v-studio-basic/start.sh".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/creativity/synthv/start.sh";
    "Applications/synthesizer-v-studio-basic/zenity-fix.sh".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/creativity/synthv/zenity-fix.sh";
  };
}
