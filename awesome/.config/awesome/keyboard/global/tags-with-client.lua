return tableCompat.join(
  awful.key(
    {modkey},
    "#" .. 7 + 9,
    function()
      local tag =
        awful.tag.add(
        "🍺",
        {
          index = 7,
          layout = awful.layout.suit.tile,
          master_fill_policy = "master_width_factor",
          master_width_factor = 0.7
        }
      )
      tag:view_only()

      -- os.execute permits here to open clients in the right order
      -- FIXME: performance (using awful.spawn ?)
      os.execute("dex " .. os.getenv("HOME") .. "/.local/share/applications/chrome-com.desktop")
      os.execute("dex " .. os.getenv("HOME") .. "/.local/share/applications/twitter.desktop")
      os.execute("dex " .. os.getenv("HOME") .. "/.local/share/applications/google-messages.desktop")
    end,
    {description = "communication tag", group = "tag"}
  ),
  awful.key(
    {modkey},
    "#" .. 8 + 9,
    function()
      local tag =
        awful.tag.add(
        "🔍",
        {
          index = 8,
          layout = awful.layout.suit.tile
        }
      )
      tag:view_only()
      awful.spawn(browser)
    end,
    {description = "browser tag", group = "tag"}
  ),
  awful.key(
    {modkey},
    "#" .. 9 + 9,
    function()
      local tag =
        awful.tag.add(
        "🛠",
        {
          index = 9,
          layout = awful.layout.suit.tile,
          master_width_factor = 0.7
        }
      )
      tag:view_only()
      awful.spawn(guieditor)
    end,
    {description = "code tag", group = "tag"}
  )
)