{
  lib,
  stdenvNoCC,
  fetchurl,
  jdk17,
}:
let
  jre = jdk17;
in
stdenvNoCC.mkDerivation rec {
  pname = "forge";
  version = "1.19.2-43.5.1";

  src = fetchurl {
    url = "https://maven.minecraftforge.net/net/minecraftforge/forge/${version}/forge-${version}-installer.jar";
    hash = "sha256-jeO+ArdLDMWCxTmjOOBNHLiaKeNYv3mArGZHMENBT80=";
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
        ${lib.getExe jre} -jar $out/lib/minecraft/installer.jar --installServer
      fi

      if [ -e "forge-${version}*.jar" ] || [ -e "forge-${version}.jar" ]; then
        exec ${lib.getExe jre} \$@ -jar forge-${version}*.jar nogui
      else
        exec ${lib.getExe jre} \$@ @${forgeJarAlternate}/unix_args.txt
      fi
      EOF

      chmod +x $out/bin/minecraft-server
    '';

  dontUnpack = true;

  meta = with lib; {
    description = "Massive API and mod loader used by modders to hook into Minecraft's code.";
    homepage = "https://minecraftforge.net";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
    maintainers = with maintainers; [ heliboss ];
    mainProgram = "minecraft-server";
  };
}
