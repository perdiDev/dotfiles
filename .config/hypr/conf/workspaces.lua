-- 
-- Workspace Configuration
--

hl.workspace_rule({
    workspace = "1",
    default = true,
    default_name = "Dev",
    persistent = true
})

hl.workspace_rule({
    workspace = "2",
    default_name = "Code",
})

hl.workspace_rule({
    workspace = "3",
    default_name = "Learn",
    on_created_empty = "zen-browser"
})

hl.workspace_rule({
    workspace = "4",
    default_name = "Life",
})

hl.workspace_rule({
    workspace = "5",
    default_name = "Fun",
})
