return tableCompat.join(
  -- Take a screenshot
  -- https://github.com/lcpz/dots/blob/master/bin/screenshot
  awful.key(
    {},
    "Print",
    function()
      awful.spawn.with_shell("scrot ~/screenshots/%Y-%m-%d-%T.png")
    end,
    {description = "take a screenshot", group = "hotkeys"}
  ),
  -- X screen locker
  awful.key(
    {altkey, "Control"},
    "l",
    function()
      os.execute(scrlocker)
    end,
    {description = "lock screen", group = "hotkeys"}
  ),
  -- Brightness
  awful.key(
    {},
    "XF86MonBrightnessUp",
    function()
      os.execute("xbacklight -inc 5")
    end,
    {description = "+5%", group = "hotkeys"}
  ),
  awful.key(
    {},
    "XF86MonBrightnessDown",
    function()
      os.execute("xbacklight -dec 5")
    end,
    {description = "-5%", group = "hotkeys"}
  ), 
  awful.key(
    {modkey},
    "XF86MonBrightnessUp",
    function()
      os.execute("xbacklight = 100")
    end,
    {description = "highest brightness", group = "hotkeys"}
  ),
  awful.key(
    {modkey},
    "XF86MonBrightnessDown",
    function()
      os.execute("xbacklight = 1")
    end,
    {description = "lowest brightness", group = "hotkeys"}
  ),
  -- Copy primary to clipboard (terminals to gtk)
  awful.key(
    {modkey},
    "c",
    function()
      awful.spawn.with_shell("xsel | xsel -i -b")
    end,
    {description = "copy terminal to gtk", group = "hotkeys"}
  ),
  -- Copy clipboard to primary (gtk to terminals)
  awful.key(
    {modkey},
    "v",
    function()
      awful.spawn.with_shell("xsel -b | xsel")
    end,
    {description = "copy gtk to terminal", group = "hotkeys"}
  )
)