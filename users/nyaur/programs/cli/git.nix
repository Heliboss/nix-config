{
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Heliboss";
        email = "99956405+Heliboss@users.noreply.github.com";
      };
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    git-crypt
  ];
}
