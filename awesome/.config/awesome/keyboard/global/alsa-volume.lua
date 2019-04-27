local beautiful = require("beautiful")

return tableCompat.join(
  awful.key(
    {},
    "XF86AudioRaiseVolume",
    function()
      os.execute(string.format("amixer -q set %s 1%%+", beautiful.volume.channel))
      beautiful.volume.update()
    end,
    {description = "volume up", group = "hotkeys"}
  ),
  awful.key(
    {},
    "XF86AudioLowerVolume",
    function()
      os.execute(string.format("amixer -q set %s 1%%-", beautiful.volume.channel))
      beautiful.volume.update()
    end,
    {description = "volume down", group = "hotkeys"}
  ),
  awful.key(
    {},
    "XF86AudioMute",
    function()
      os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
      beautiful.volume.update()
    end,
    {description = "toggle mute", group = "hotkeys"}
  ),
  awful.key(
    {altkey},
    "XF86AudioRaiseVolume",
    function()
      os.execute(string.format("amixer -q set %s 100%%", beautiful.volume.channel))
      beautiful.volume.update()
    end,
    {description = "volume 100%", group = "hotkeys"}
  ),
  awful.key(
    {altkey},
    "XF86AudioLowerVolume",
    function()
      os.execute(string.format("amixer -q set %s 0%%", beautiful.volume.channel))
      beautiful.volume.update()
    end,
    {description = "volume 0%", group = "hotkeys"}
  )
)