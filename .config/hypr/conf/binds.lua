--
-- Keybindings Configuration
--

-- Apps
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("ghostty +new-window"))
hl.bind("SUPER + I", hl.dsp.exec_cmd("zen-browser"))
hl.bind("SUPER + U", hl.dsp.exec_cmd("zeditor"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("obsidian"))
hl.bind("SUPER + P", hl.dsp.exec_cmd("wofi --show run dmenu"))
hl.bind("SUPER + SHIFT + slash", hl.dsp.exec_cmd("ghostty -e btop"))

-- Window
hl.bind("SUPER + BackSpace", hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.window.float({set="toggle"}))

-- Window Navigation
hl.bind("SUPER + h", hl.dsp.focus({direction="l"}))
hl.bind("SUPER + l", hl.dsp.focus({direction="r"}))
hl.bind("SUPER + k", hl.dsp.focus({direction="d"}))
hl.bind("SUPER + j", hl.dsp.focus({direction="u"}))

-- Window movement for some workspace
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({workspace=1}))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({workspace=2}))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({workspace=3}))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({workspace=4}))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({workspace=5}))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({workspace=1}))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({workspace=2}))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({workspace=3}))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({workspace=4}))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({workspace=5}))

-- Workspace
hl.bind("SUPER + BracketRight", hl.dsp.focus({workspace="e+1"}))
hl.bind("SUPER + BracketLeft", hl.dsp.focus({workspace="e-1"}))
hl.bind("SUPER + 1", hl.dsp.focus({workspace="1"}))
hl.bind("SUPER + 2", hl.dsp.focus({workspace="2"}))
hl.bind("SUPER + 3", hl.dsp.focus({workspace="3"}))
hl.bind("SUPER + 4", hl.dsp.focus({workspace="4"}))
hl.bind("SUPER + 5", hl.dsp.focus({workspace="5"}))
hl.bind("SUPER + 0", hl.dsp.focus({workspace="1"}))
hl.bind("SUPER + 9", hl.dsp.focus({workspace="2"}))
hl.bind("SUPER + 8", hl.dsp.focus({workspace="3"}))
hl.bind("SUPER + 7", hl.dsp.focus({workspace="4"}))
hl.bind("SUPER + 6", hl.dsp.focus({workspace="5"}))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))

-- Screenshoot
hl.bind("SUPER + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))

-- Mouse
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })    -- ALT + LMB: Move a window

-- Multimedia
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true })
