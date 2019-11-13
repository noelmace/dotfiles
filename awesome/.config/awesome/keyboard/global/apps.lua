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
  -- emoji-keyboard
  awful.key(
    {modkey},
    "z",
    function()
      awful.spawn.with_shell("emoji-keyboard -s")
    end,
    {description = "emoji search", group = "apps"}
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
