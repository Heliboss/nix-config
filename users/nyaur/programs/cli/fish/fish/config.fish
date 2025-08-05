function m
  if count $argv > /dev/null
    hyprctl keyword monitor $argv
  else
    hyprctl monitors
    echo "Usage: m [NAME],[RES],[POS],[SCALE]"
    echo "Example: m eDP-1,preferred,auto,1"
  end
end

function mtp
  if test -d ~/Media
    fusermount -u ~/Media; rm -r ~/Media
  else
    mkdir ~/Media; jmtpfs ~/Media
  end
end

function up
  if test -e ~/.floorp/nyaur/containers.json.backup
    rm ~/.floorp/nyaur/containers.json.backup # Hacky workaround for containers.json.backup getting clobbered
  end
  nh os switch -u -- --fallback
end

function sw
  if test -e ~/.floorp/nyaur/containers.json.backup
    rm ~/.floorp/nyaur/containers.json.backup # Hacky workaround for containers.json.backup getting clobbered
  end
  nh os switch
end
