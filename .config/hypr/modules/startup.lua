return function(settings)
    local app = settings.apps

    hl.on("hyprland.start", function()
        hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_MENU_PREFIX XDG_SESSION_TYPE")
        hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_MENU_PREFIX XDG_SESSION_TYPE QT_QPA_PLATFORM GDK_BACKEND")
        hl.exec_cmd("pgrep -x dunst >/dev/null || dunst")
        hl.exec_cmd("pgrep -x nm-applet >/dev/null || nm-applet --indicator")
        hl.exec_cmd("sh -lc 'command -v kded6 >/dev/null 2>&1 && (pgrep -x kded6 >/dev/null || kded6)'")
        hl.exec_cmd("pgrep -x waybar >/dev/null || waybar")
        hl.exec_cmd("pgrep -x awww-daemon >/dev/null || awww-daemon")
        hl.exec_cmd("sh -lc 'sleep 1; " .. app.wallpaper_script .. " cache'")
    end)
end
