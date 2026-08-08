-- Autostart
hl.on('hyprland.start', function()
  hl.exec_cmd "swaybg -o '*' -i ~/.config/hypr/wallpaper/samyo.jpg -m fill"
  hl.exec_cmd 'waybar'
  hl.exec_cmd 'brightnessctl s 100%'
end)
