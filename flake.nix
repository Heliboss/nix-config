{
  description = "i use nix btw";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    pipewire-screenaudio.url = "github:IceDBorn/pipewire-screenaudio";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    yt-x.url = "github:Benexl/yt-x";
    fastanime.url = "github:Benexl/fastanime";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
    # Remember to set
    # environment.persistence."/persist".enable = false;
    # on a non-impermanent setup
    nixosConfigurations = {
      # Main
      starflower = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
	  inherit inputs;
	  device = "/dev/nvme0n1";
	};
	modules = [
          ./hosts/starflower
          { home-manager.extraSpecialArgs = specialArgs; }
        ];
      };
    };

    homeConfigurations = {
      # Main
      "nyaur@starflower" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./users/nyaur/starflower.nix
        ];
      };
    };
  };
}
