-- Modifier key
local mod = 'SUPER'

-- Programs
hl.bind(mod .. ' + T', hl.dsp.exec_cmd 'foot')
hl.bind(mod .. ' + R', hl.dsp.exec_cmd 'bash ~/.config/rofi/launcher/launcher.sh')
hl.bind(mod .. ' + N', hl.dsp.exec_cmd 'grimblast --freeze copy area; pkill hyprpicker')

-- Actions
hl.bind(mod .. ' + Q', hl.dsp.window.close())
hl.bind(mod .. ' + SHIFT + Apostrophe', hl.dsp.exec_cmd "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
hl.bind(mod .. ' + F', hl.dsp.window.fullscreen { action = 'toggle' })
hl.bind(mod .. ' + V', hl.dsp.window.float { action = 'toggle' })

-- Move focus
hl.bind(mod .. ' + left', hl.dsp.focus { direction = 'left' })
hl.bind(mod .. ' + right', hl.dsp.focus { direction = 'right' })
hl.bind(mod .. ' + up', hl.dsp.focus { direction = 'up' })
hl.bind(mod .. ' + down', hl.dsp.focus { direction = 'down' })

-- Move active window
hl.bind(mod .. ' + SHIFT + left', hl.dsp.window.move { direction = 'left' })
hl.bind(mod .. ' + SHIFT + right', hl.dsp.window.move { direction = 'right' })
hl.bind(mod .. ' + SHIFT + up', hl.dsp.window.move { direction = 'up' })
hl.bind(mod .. ' + SHIFT + down', hl.dsp.window.move { direction = 'down' })

hl.bind(mod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })

-- Resize active window
hl.bind(mod .. ' + ALT + left', hl.dsp.window.resize { x = '-106', y = 0 })
hl.bind(mod .. ' + ALT + right', hl.dsp.window.resize { x = '-106', y = 0 })
hl.bind(mod .. ' + ALT + up', hl.dsp.window.resize { x = '-106', y = 0 })
hl.bind(mod .. ' + ALT + down', hl.dsp.window.resize { x = '-106', y = 0 })

-- Switch workspaces
for i = 1, 10 do
  local key = i % 10
  hl.bind(mod .. ' + ' .. key, hl.dsp.focus { workspace = i })
  hl.bind(mod .. ' + SHIFT + ' .. key, hl.dsp.window.move { workspace = i })
end

-- Media keys
hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd 'wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+')
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-')
hl.bind('XF86AudioMute', hl.dsp.exec_cmd 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle')
hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle')
hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd 'brightnessctl s 10%+')
hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd 'brightnessctl s 10%-')
hl.bind('XF86AudioPause', hl.dsp.exec_cmd 'playerctl pause')
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd 'playerctl play-pause')

hl.bind('XF86AudioNext', hl.dsp.exec_cmd 'playerctl position 5+')
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd 'playerctl position 5-')
