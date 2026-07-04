local home = os.getenv("HOME")

local M = {}

M.mod = "SUPER"

M.cursor = {
    theme = "Bibata-Modern-Ice",
    size = 24,
}

M.fonts = {
    ui = "JetBrainsMono Nerd Font",
    ui_size = 10,
    mono = "JetBrainsMono Nerd Font Mono",
    mono_size = 10,
    bar = "JetBrainsMono Nerd Font",
    notification = "JetBrainsMono Nerd Font",
}

M.apps = {
    terminal = "kitty",
    file_manager = "dolphin",
    editor = "code",
    browser = "firefox",
    system_monitor = "kitty -e btop",
    launcher = home .. "/.local/bin/rofi-launch",
    window_switcher = "pkill -x rofi || rofi -show window",
    file_finder = "dolphin",
    wallpaper = home .. "/.local/bin/rofi-wallpaper",
    wallpaper_script = home .. "/.local/bin/wallpaper",
    logout_menu = home .. "/.local/bin/logout-menu",
    screenshot = "grim -g \"$(slurp)\" - | satty --filename - --copy-command wl-copy",
    logout = "hyprctl dispatch exit",
}

M.classes = {
    terminal = M.apps.terminal,
    file_manager = "org.kde.dolphin",
    editor = "[Cc]ode",
    browser = M.apps.browser,
    rofi = "rofi",
    satty = "com.gabm.satty",
}

return M
