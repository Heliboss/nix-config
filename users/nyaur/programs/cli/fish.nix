{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      ${builtins.readFile ../../dotfiles/.config/fish/config.fish}
    '';
  };
}
