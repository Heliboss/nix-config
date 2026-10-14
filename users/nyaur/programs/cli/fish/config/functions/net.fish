function net
  if count $argv > /dev/null
    nmcli d w c $argv --ask
  else
    nmcli d w l --rescan yes
  end
end
