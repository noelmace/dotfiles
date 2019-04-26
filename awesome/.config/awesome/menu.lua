local freedesktop = require("freedesktop")

local myawesomemenu = {
  {
    "hotkeys",
    function()
      return false, hotkeys_popup.show_help
    end
  },
  {"manual", terminal .. " -e man awesome"},
  {"edit config", string.format("%s -e %s %s", terminal, editor, awesome.conffile)},
  {"restart", awesome.restart},
  {
    "quit",
    function()
      awesome.quit()
    end
  }
}

awful.util.mymainmenu =
  freedesktop.menu.build(
  {
    icon_size = beautiful.menu_height or dpi(16),
    before = {
      {"Awesome", myawesomemenu, beautiful.awesome_icon}
      -- other triads can be put here
    },
    after = {
      {"Open terminal", terminal}
      -- other triads can be put here
    }
  }
)

if (config.menu.mouseOnly) then 
  -- hide menu when mouse leaves it
  awful.util.mymainmenu.wibox:connect_signal("mouse::leave", function() awful.util.mymainmenu:hide() end)
end