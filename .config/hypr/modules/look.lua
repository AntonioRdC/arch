local ctp = require("modules.catppuccin")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 12,
        border_size = 2,
        resize_on_border = true,
        extend_border_grab_area = 18,
        hover_icon_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
        col = {
            active_border = { colors = { "rgba(" .. ctp.redAlpha .. "ee)", "rgba(" .. ctp.pinkAlpha .. "ee)" }, angle = 45 },
            inactive_border = "rgba(" .. ctp.mantleAlpha .. "aa)",
        },
    },

    decoration = {
        rounding = 8,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 8,
            render_power = 2,
            color = "rgba(" .. ctp.crustAlpha .. "ee)",
        },
        blur = {
            enabled = true,
            size = 4,
            passes = 2,
            vibrancy = 0.18,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
    },
})
