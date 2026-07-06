return function(settings)
    local app = settings.apps
    local mod = settings.mod

    hl.bind(mod .. " + Q", hl.dsp.window.close(), { description = "Close focused window" })
    hl.bind("ALT + F4", hl.dsp.window.close(), { description = "Close focused window" })
    hl.bind(mod .. " + Escape", hl.dsp.exec_cmd(app.logout_menu), { description = "Logout menu" })
    hl.bind(mod .. " + W", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
    hl.bind(mod .. " + G", hl.dsp.group.toggle(), { description = "Toggle group" })
    hl.bind("SHIFT + F11", hl.dsp.window.fullscreen(), { description = "Toggle fullscreen" })
    hl.bind(mod .. " + SHIFT + F", hl.dsp.window.pin(), { description = "Toggle pin" })
    hl.bind(mod .. " + J", hl.dsp.layout("togglesplit"), { description = "Toggle split" })

    hl.bind(mod .. " + T", hl.dsp.exec_cmd(app.terminal), { description = "Terminal" })
    hl.bind(mod .. " + E", hl.dsp.exec_cmd(app.file_manager), { description = "File manager" })
    hl.bind(mod .. " + C", hl.dsp.exec_cmd(app.editor), { description = "Editor" })
    hl.bind(mod .. " + B", hl.dsp.exec_cmd(app.browser), { description = "Browser" })
    hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd(app.system_monitor), { description = "System monitor" })

    hl.bind(mod .. " + A", hl.dsp.exec_cmd(app.launcher), { description = "Application launcher" })
    hl.bind(mod .. " + TAB", hl.dsp.exec_cmd(app.window_switcher), { description = "Window switcher" })
    hl.bind(mod .. " + SHIFT + E", hl.dsp.exec_cmd(app.file_finder), { description = "File finder" })
    hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd(app.wallpaper), { description = "Wallpaper picker" })

    hl.bind(mod .. " + Left", hl.dsp.focus({ direction = "left" }), { description = "Focus left" })
    hl.bind(mod .. " + Right", hl.dsp.focus({ direction = "right" }), { description = "Focus right" })
    hl.bind(mod .. " + Up", hl.dsp.focus({ direction = "up" }), { description = "Focus up" })
    hl.bind(mod .. " + Down", hl.dsp.focus({ direction = "down" }), { description = "Focus down" })
    hl.bind("ALT + Tab", function()
        hl.dispatch(hl.dsp.window.cycle_next())
        hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
    end, { description = "Cycle focus" })

    hl.bind(mod .. " + SHIFT + Left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true, description = "Resize left" })
    hl.bind(mod .. " + SHIFT + Right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true, description = "Resize right" })
    hl.bind(mod .. " + SHIFT + Up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true, description = "Resize up" })
    hl.bind(mod .. " + SHIFT + Down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true, description = "Resize down" })

    hl.bind(mod .. " + CTRL + SHIFT + Left", hl.dsp.window.move({ direction = "left" }), { description = "Move window left" })
    hl.bind(mod .. " + CTRL + SHIFT + Right", hl.dsp.window.move({ direction = "right" }), { description = "Move window right" })
    hl.bind(mod .. " + CTRL + SHIFT + Up", hl.dsp.window.move({ direction = "up" }), { description = "Move window up" })
    hl.bind(mod .. " + CTRL + SHIFT + Down", hl.dsp.window.move({ direction = "down" }), { description = "Move window down" })

    for i = 1, 10 do
        local key = i % 10
        hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Workspace " .. i })
        hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { description = "Move to workspace " .. i })
        hl.bind(mod .. " + ALT + " .. key, hl.dsp.exec_cmd("hyprctl dispatch movetoworkspacesilent " .. i), { description = "Move silently to workspace " .. i })
    end

    hl.bind(mod .. " + CTRL + Right", hl.dsp.focus({ workspace = "r+1" }), { description = "Next workspace" })
    hl.bind(mod .. " + CTRL + Left", hl.dsp.focus({ workspace = "r-1" }), { description = "Previous workspace" })
    hl.bind(mod .. " + CTRL + Down", hl.dsp.focus({ workspace = "empty" }), { description = "Empty workspace" })
    hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Next existing workspace" })
    hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Previous existing workspace" })

    hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"), { description = "Toggle scratchpad" })
    hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:scratchpad" }), { description = "Move to scratchpad" })

    hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window" })
    hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })
    hl.bind(mod .. " + Z", hl.dsp.window.drag(), { mouse = true, description = "Move window" })
    hl.bind(mod .. " + X", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

    hl.bind("F10", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, description = "Mute audio" })
    hl.bind("F11", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true, description = "Volume down" })
    hl.bind("F12", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true, description = "Volume up" })
    hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, description = "Mute audio" })
    hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, description = "Mute microphone" })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true, description = "Volume down" })
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true, description = "Volume up" })

    hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true, description = "Brightness down" })
    hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { locked = true, repeating = true, description = "Brightness up" })

    hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play/pause" })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play/pause" })
    hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, description = "Next media" })
    hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "Previous media" })

    hl.bind("Print", hl.dsp.exec_cmd(app.screenshot), { description = "Screenshot editor" })
    hl.bind(mod .. " + P", hl.dsp.exec_cmd(app.screenshot), { description = "Screenshot editor" })
end
