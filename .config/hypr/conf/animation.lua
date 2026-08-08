--
-- Animation
--

hl.curve( "cubic", { type = "bezier", points = { {0.75, 0}, {0.25, 1} } } )

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 0.5,
    bezier = "cubic",
    style = "slidefade"
})

hl.animation({
    leaf = "windows",
    enabled = false,
})
