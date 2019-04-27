return tableCompat.join(
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
  ),
  awful.key(
    {modkey},
    "w",
    function()
      awful.util.mymainmenu:show()
    end,
    {description = "show main menu", group = "awesome"}
  )
)