{
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Heliboss";
    userEmail = "99956405+Heliboss@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    git-crypt
  ];
}
