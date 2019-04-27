return tableCompat.join(
  -- Widgets popups
  awful.key(
    {altkey},
    "c",
    function()
      if beautiful.cal then
        beautiful.cal.show(7)
      end
    end,
    {description = "show calendar", group = "widgets"}
  ),
  awful.key(
    {altkey},
    "h",
    function()
      if beautiful.fs then
        beautiful.fs.show(7)
      end
    end,
    {description = "show filesystem", group = "widgets"}
  ),
  awful.key(
    {altkey},
    "w",
    function()
      if beautiful.weather then
        beautiful.weather.show(7)
      end
    end,
    {description = "show weather", group = "widgets"}
  )
)