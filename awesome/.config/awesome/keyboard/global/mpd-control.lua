local beautiful = require("beautiful")
local naughty = require("naughty")

return tableCompat.join(
  awful.key(
    {altkey, "Control"},
    "Up",
    function()
      os.execute("mpc toggle")
      beautiful.mpd.update()
    end,
    {description = "mpc toggle", group = "widgets"}
  ),
  awful.key(
    {altkey, "Control"},
    "Down",
    function()
      os.execute("mpc stop")
      beautiful.mpd.update()
    end,
    {description = "mpc stop", group = "widgets"}
  ),
  awful.key(
    {altkey, "Control"},
    "Left",
    function()
      os.execute("mpc prev")
      beautiful.mpd.update()
    end,
    {description = "mpc prev", group = "widgets"}
  ),
  awful.key(
    {altkey, "Control"},
    "Right",
    function()
      os.execute("mpc next")
      beautiful.mpd.update()
    end,
    {description = "mpc next", group = "widgets"}
  ),
  awful.key(
    {altkey},
    "0",
    function()
      local common = {text = "MPD widget ", position = "top_middle", timeout = 2}
      if beautiful.mpd.timer.started then
        beautiful.mpd.timer:stop()
        common.text = common.text .. lain.util.markup.bold("OFF")
      else
        beautiful.mpd.timer:start()
        common.text = common.text .. lain.util.markup.bold("ON")
      end
      naughty.notify(common)
    end,
    {description = "mpc on/off", group = "widgets"}
  )
)
