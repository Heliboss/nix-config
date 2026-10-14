function mon
  if count $argv > /dev/null
    hyprctl keyword monitor $argv
  else
    hyprctl monitors
    echo "Usage: mon [NAME],[RES],[POS],[SCALE]"
    echo "Example: mon eDP-1,preferred,auto,1"
  end
end
