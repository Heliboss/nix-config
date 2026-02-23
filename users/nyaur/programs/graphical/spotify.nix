{ pkgs, ... }:
let
  spotify-adblock = pkgs.rustPlatform.buildRustPackage rec {
    pname = "spotify-adblock";
    version = "1.0.3";
    src = pkgs.fetchFromGitHub {
      owner = "abba23";
      repo = "spotify-adblock";
      rev = "v${version}";
      hash = "sha256-UzpHAHpQx2MlmBNKm2turjeVmgp5zXKWm3nZbEo0mYE=";
    };

    useFetchCargoVendor = true;
    cargoHash = "sha256-oGpe+kBf6kBboyx/YfbQBt1vvjtXd1n2pOH6FNcbF8M=";

    patchPhase = ''
      substituteInPlace src/lib.rs --replace-fail 'config.toml' $out/etc/spotify-adblock/config.toml
    '';

    buildPhase = ''
      make
    '';

    installPhase = ''
      mkdir -p $out/etc/spotify-adblock
      install -D --mode=644 config.toml $out/etc/spotify-adblock
      mkdir -p $out/lib
      install -D --mode=644 --strip target/release/libspotifyadblock.so $out/lib
    '';
  };

  spotify-override = pkgs.spotify.overrideAttrs (old: {
    buildInputs = (old.buildInputs or [ ]) ++ [ pkgs.zip pkgs.unzip ];
    postInstall = (old.postInstall or "") + ''
      ln -s ${spotify-adblock}/lib/libspotifyadblock.so $libdir
      wrapProgram $out/bin/spotify --set LD_PRELOAD "${spotify-adblock}/lib/libspotifyadblock.so"
    '';
  });
in {
  home.packages = [ spotify-override ];

  home.persistence."/persist" = {
    directories = [ ".config/spotify" ".cache/spotify" ];
  };
}
