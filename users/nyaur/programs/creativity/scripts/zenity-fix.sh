#!/bin/sh
if [ -z "$(ls /tmp)" ]; then
   mkdir -p /tmp/synthv
   rsync -av /usr/bin /tmp/synthv --exclude=zenity
   PATH="$(printf "$PATH" | sed 's|/usr/bin|/tmp/synthv/bin|')" ~/Applications/synthesizer-v-studio-basic/synthv-studio
else
   echo "You must be in an FHS environment!"
fi
