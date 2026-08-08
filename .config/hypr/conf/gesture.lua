-- 
-- Gesture conf
--

hl.gesture({fingers = 3, direction = "horizontal", action = "workspace"})

local function toggle_float_halfscreen()
    -- Ambil monitor yang sedang aktif
    local monitor = hl.get_monitor("current")

    if monitor == nil then
        return
    end

    -- Toggle tiled <-> floating
    hl.dispatch(
        hl.dsp.window.float({
            action = "toggle",
        })
    )

    -- Ukuran 50% monitor
    local width = math.floor(monitor.width * 0.5)
    local height = math.floor(monitor.height * 0.5)

    -- Resize active window
    hl.dispatch(
        hl.dsp.window.resize({
            x = width,
            y = height,
            relative = false,
        })
    )

    -- Center active floating window
    hl.dispatch(
        hl.dsp.window.center()
    )
end

-- Pinch in
hl.gesture({
    fingers = 3,
    direction = "pinchin",
    action = toggle_float_halfscreen,
})

-- Pinch out
hl.gesture({
    fingers = 3,
    direction = "pinchout",
    action = toggle_float_halfscreen,
})
