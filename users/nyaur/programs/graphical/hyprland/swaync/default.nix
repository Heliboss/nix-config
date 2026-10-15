{ config, ... }: {
  services.swaync = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ./config/config.json);
    style = ./config/style.css;
  };
}
