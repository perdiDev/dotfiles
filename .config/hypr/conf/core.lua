--
-- Core
--

local general = {
    gaps_in = 1,
    gaps_out = 4,

    border_size = 1,

    resize_on_border = true,
    layout = "master",

    col = {
        active_border = {colors = {"rgba(89dcebee)", "rgba(f5c2e7ee)"}, angle=45},
        inactive_border = "rgba(595959aa)",
    }
}

local animations = {
    enabled = true
}

local decoration = {
    rounding = 8,
    rounding_power = 3,

    active_opacity = 0.85,
    inactive_opacity = 0.6,

    shadow = {
        enabled = false, -- to save battery
        color = "rgba(1a1a1aee)",
    },

    blur = {
        enabled = true, -- to save battery
        size = 10,
        passes = 2,
        noise = 0.15,
        popups = true,
    },
}

local misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    force_default_wallpaper = 1,
    font_family = "JetBrainsMono Nerd Font",
    key_press_enables_dpms = true,
    mouse_move_focuses_monitor = true
}

hl.config({
    general = general,
    animations = animations,
    decoration = decoration,
    misc = misc
})

