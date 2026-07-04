return function(settings)
    local classes = settings.classes

    hl.window_rule({
        name = "suppress-maximize-events",
        match = { class = ".*" },
        suppress_event = "maximize",
    })

    hl.window_rule({
        name = "fix-xwayland-drags",
        match = {
            class = "^$",
            title = "^$",
            xwayland = true,
            float = true,
            fullscreen = false,
            pin = false,
        },
        no_focus = true,
    })

    hl.window_rule({
        name = "float-rofi",
        match = { class = "^(" .. classes.rofi .. ")$" },
        float = true,
        center = true,
    })

    hl.window_rule({
        name = "satty",
        match = { class = "^(" .. classes.satty .. ")$" },
        float = true,
        center = true,
    })

    hl.layer_rule({
        name = "blur-wlogout",
        match = { namespace = "^logout_dialog$" },
        blur = true,
        ignore_alpha = 0.2,
        dim_around = true,
    })

    hl.layer_rule({
        name = "blur-waybar",
        match = { namespace = "^waybar$" },
        blur = true,
        ignore_alpha = 0.2,
    })
end
