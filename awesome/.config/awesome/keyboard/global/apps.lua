return tableCompat.join(
  awful.key(
    {modkey},
    "Return",
    function()
      awful.spawn(terminal)
    end,
    {description = "open a terminal", group = "apps"}
  ),
  -- User programs
  awful.key(
    {modkey},
    "q",
    function()
      awful.spawn(browser)
    end,
    {description = "run browser", group = "apps"}
  ),
  awful.key(
    {modkey},
    "a",
    function()
      awful.spawn(guieditor)
    end,
    {description = "run gui editor", group = "apps"}
  ),
  -- zotero
  awful.key(
    {modkey},
    "z",
    function()
      awful.spawn("zotero")
    end,
    {description = "zotero", group = "apps"}
  ),
  -- screen capture GUI
  awful.key(
    {modkey, altkey},
    "r",
    function()
      awful.spawn("peek", {
        floating = true,
        focus = true,
        titlebars_enabled = false,
        maximized = true
      })
    end,
    {description = "screen recording", group = "apps"}
  ),
  -- Writing
  awful.key(
    {modkey},
    "g",
    function()
      awful.spawn("ghostwriter")
    end,
    {description = "screen recording", group = "apps"}
  ),
  awful.key(
    {modkey, "Shift"},
    "#" .. 9 + 9,
    function()
      awful.spawn(browser)
      awful.spawn(guieditor)
      awful.spawn(terminal)
      awful.spawn("ghostwriter")
    end,
    {description = "open all favorite apps", group = "apps"}
  )
)
