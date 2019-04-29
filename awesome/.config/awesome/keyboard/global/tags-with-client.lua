return tableCompat.join(
  awful.key(
    {modkey},
    "#" .. 7 + 9,
    function()
      local tag = awful.screen.focused().selected_tag
      tag.name = tag.name .. ".🍺"
      tag.layout = awful.layout.suit.tile
      tag.master_fill_policy = "master_width_factor"
      tag.master_width_factor = 0.7

      -- os.execute permits here to open clients in the right order
      -- FIXME: performance (using awful.spawn ?)
      os.execute("dex " .. os.getenv("HOME") .. "/.local/share/applications/chrome-com.desktop")
      os.execute("dex " .. os.getenv("HOME") .. "/.local/share/applications/twitter.desktop")
      os.execute("dex " .. os.getenv("HOME") .. "/.local/share/applications/google-messages.desktop")
    end,
    {description = "set tag as 🍺", group = "dynamic tagging"}
  ),
  awful.key(
    {modkey},
    "#" .. 8 + 9,
    function()
      local tag = awful.screen.focused().selected_tag
      tag.name = tag.name .. ".🔍"
      tag.layout = awful.layout.suit.tile
      awful.spawn(browser)
    end,
    {description = "set tag as 🔍", group = "dynamic tagging"}
  ),
  awful.key(
    {modkey},
    "#" .. 9 + 9,
    function()
      local tag = awful.screen.focused().selected_tag
      tag.master_width_factor = 0.7
      tag.layout = awful.layout.suit.tile
      tag.name = tag.name .. ".🛠"
      awful.spawn(guieditor)
    end,
    {description = "set tag as 🛠", group = "dynamic tagging"}
  )
)