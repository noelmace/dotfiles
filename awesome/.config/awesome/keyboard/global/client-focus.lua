return tableCompat.join(
  awful.key(
    {modkey, "Shift"},
    "j",
    function()
      awful.client.swap.byidx(1)
    end,
    {description = "swap with next client by index", group = "client"}
  ),
  awful.key(
    {modkey, "Shift"},
    "k",
    function()
      awful.client.swap.byidx(-1)
    end,
    {description = "swap with previous client by index", group = "client"}
  ),
  awful.key({modkey}, "u", awful.client.urgent.jumpto, {description = "jump to urgent client", group = "client"}),
  awful.key(
    {modkey},
    "Tab",
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "go back", group = "client"}
  ),
  awful.key(
    {modkey, "Control"},
    "n",
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        client.focus = c
        c:raise()
      end
    end,
    {description = "restore minimized", group = "client"}
  ),
  -- Default client focus
  awful.key(
    {altkey},
    "j",
    function()
      awful.client.focus.byidx(1)
    end,
    {description = "focus next by index", group = "client"}
  ),
  awful.key(
    {altkey},
    "k",
    function()
      awful.client.focus.byidx(-1)
    end,
    {description = "focus previous by index", group = "client"}
  ),
  -- By direction client focus
  awful.key(
    {modkey},
    "j",
    function()
      awful.client.focus.global_bydirection("down")
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "focus down", group = "client"}
  ),
  awful.key(
    {modkey},
    "k",
    function()
      awful.client.focus.global_bydirection("up")
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "focus up", group = "client"}
  ),
  awful.key(
    {modkey},
    "h",
    function()
      awful.client.focus.global_bydirection("left")
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "focus left", group = "client"}
  ),
  awful.key(
    {modkey},
    "l",
    function()
      awful.client.focus.global_bydirection("right")
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "focus right", group = "client"}
  )
)