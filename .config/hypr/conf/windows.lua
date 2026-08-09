--
-- Window Configuration
--

hl.window_rule({
    name = "Picture-in-Picture Window",
    match = {
        title = "Picture-in-Picture"
    },
    float = true,
    move = {"monitor_w-window_w+50", "monitor_h-window_h-10"},
    size = {"(monitor_w*0.3)", "(monitor_h*0.3)"},
    pin = true
})

hl.window_rule({
    name = "Browser",
    match = {
        class = "zen",
    },
    opacity = "0.925 override"
})

hl.window_rule({
    name = "Music",
    match = {
        class = "Spotify"
    },
    opacity = "0.75 override"
})

hl.window_rule({
    name = "Floating Window",
    match = {
        float = true,
    },
    center = true,
    size = {"(monitor_w * 0.5)", "(monitor_h * 0.5)"}
})
