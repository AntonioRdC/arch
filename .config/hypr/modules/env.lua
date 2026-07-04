return function(settings)
    local cursor = settings.cursor

    hl.env("XCURSOR_THEME", cursor.theme)
    hl.env("HYPRCURSOR_THEME", cursor.theme)
    hl.env("XCURSOR_SIZE", tostring(cursor.size))
    hl.env("HYPRCURSOR_SIZE", tostring(cursor.size))

    hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
    hl.env("XDG_MENU_PREFIX", "arch-")
    hl.env("XDG_SESSION_DESKTOP", "Hyprland")
    hl.env("XDG_SESSION_TYPE", "wayland")

    hl.env("GDK_BACKEND", "wayland,x11,*")
    hl.env("GTK_THEME", "catppuccin-mocha-pink-standard+default")
    hl.env("QT_QPA_PLATFORM", "wayland;xcb")
    hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
    hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
    hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
    hl.env("SDL_VIDEODRIVER", "wayland")
    hl.env("CLUTTER_BACKEND", "wayland")

    hl.env("MOZ_ENABLE_WAYLAND", "1")
    hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
end
