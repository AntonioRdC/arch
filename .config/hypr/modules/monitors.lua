hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "0x0",
    scale = "1",
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

hl.workspace_rule({
    workspace = "1",
    monitor = "eDP-1",
    default = true,
    persistent = true,
})
