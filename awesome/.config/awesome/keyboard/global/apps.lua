return tableCompat.join(
  awful.key(
    {modkey},
    "Return",
    function()
      awful.spawn(terminal)
    end,
    {description = "open a terminal", group = "launcher"}
  ),
  -- User programs
  awful.key(
    {modkey},
    "q",
    function()
      awful.spawn(browser)
    end,
    {description = "run browser", group = "launcher"}
  ),
  awful.key(
    {modkey},
    "a",
    function()
      awful.spawn(guieditor)
    end,
    {description = "run gui editor", group = "launcher"}
  ),
  -- Dropdown application
  awful.key(
    {modkey},
    "z",
    function()
      -- FIXME
      awful.screen.focused().quake:toggle()
    end,
    {description = "dropdown application", group = "launcher"}
  )
)
