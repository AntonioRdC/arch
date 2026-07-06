return function(settings)
    local classes = settings.classes

    local function regex_escape(value)
        return (value:gsub("([%(%)%.%%%+%-%*%?%[%]%^%$])", "\\%1"))
    end

    local function exact_class(value)
        return "^(" .. regex_escape(value) .. ")$"
    end

    local function class_group(values)
        local escaped = {}

        for index, value in ipairs(values) do
            escaped[index] = regex_escape(value)
        end

        return "^(" .. table.concat(escaped, "|") .. ")$"
    end

    local function opacity(name, class, active, inactive)
        hl.window_rule({
            name = name,
            match = { class = class },
            opacity = active .. " " .. inactive,
        })
    end

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
        name = "picture-in-picture",
        match = { title = "^([Pp]icture[- ]?[Ii]n[- ]?[Pp]icture)(.*)$" },
        tag = "+picture-in-picture",
        float = true,
        keep_aspect_ratio = true,
        move = "(monitor_w*0.73) (monitor_h*0.72)",
        size = "(monitor_w*0.25) (monitor_h*0.25)",
        pin = true,
    })

    opacity("opacity-terminal", exact_class(classes.terminal), "0.88", "0.82")
    opacity("opacity-files", exact_class(classes.file_manager), "0.90", "0.84")
    opacity("opacity-code", "^(" .. classes.editor .. ")$", "0.92", "0.86")
    opacity("opacity-browser", exact_class(classes.browser), "0.96", "0.90")
    opacity("opacity-spotify", "^([Ss]potify)$", "0.90", "0.84")
    opacity("opacity-ark", "^(org\\.kde\\.ark)$", "0.90", "0.84")
    opacity("opacity-viewers", class_group({ "eog", "vlc", "qbittorrent" }), "0.92", "0.86")

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

    hl.window_rule({
        name = "float-ark",
        match = { class = "^(org\\.kde\\.ark)$" },
        float = true,
        center = true,
    })

    hl.window_rule({
        name = "idle-inhibit-video",
        match = { class = "^(firefox|vlc|[Ss]potify)$" },
        idle_inhibit = "fullscreen",
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

    hl.layer_rule({
        name = "blur-rofi",
        match = { namespace = "^rofi$" },
        blur = true,
        ignore_alpha = 0.2,
    })

    hl.layer_rule({
        name = "blur-notifications",
        match = { namespace = "^notifications$" },
        blur = true,
        ignore_alpha = 0.2,
    })
end
