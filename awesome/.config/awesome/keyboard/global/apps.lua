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
  -- Dropdown application
  awful.key(
    {modkey},
    "z",
    function()
      awful.screen.focused().quake:toggle()
    end,
    {description = "dropdown application", group = "apps"}
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
  )
)
