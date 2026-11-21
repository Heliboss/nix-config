{
  lib,
  stdenvNoCC,
  fetchzip,
  jre_headless,
}:
stdenvNoCC.mkDerivation rec {
  pname = "forge";
  version = "1.19.2-43.5.1";

  src = fetchzip {
    url = "https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.2-43.5.1/forge-1.19.2-43.5.1-installer.jar";
    hash = "";
  };

  preferLocalBuild = true;

  installPhase =
    let
      forgeJarAlternate = "libraries/net/minecraftforge/forge/${version}";
    in
    ''
      mkdir -p $out/bin $out/lib/minecraft
      cp -v $src $out/lib/minecraft/installer.jar

      cat > $out/bin/minecraft-server << EOF
      #!/bin/sh
      if [ -e "forge-${version}*.jar" ] || [ -e "forge-${version}.jar" ] || [ -e "${forgeJarAlternate}/forge-${version}-server.jar" ]; then
        echo "Running Forge..."
      else
        echo "Installing Forge..."
        ${lib.getExe jre_headless} -jar $out/lib/minecraft/installer.jar --installServer
      fi

      if [ -e "forge-${version}*.jar" ] || [ -e "forge-${version}.jar" ]; then
        exec ${lib.getExe jre_headless} \$@ -jar forge-${version}*.jar nogui
      else
        exec ${lib.getExe jre_headless} \$@ @${forgeJarAlternate}/unix_args.txt
      fi
      EOF

      chmod +x $out/bin/minecraft-server
    '';

  dontUnpack = true;
}
