{ flake, ... }: {
  programs.nh = {
    enable = true;
    inherit flake;
  };
}
