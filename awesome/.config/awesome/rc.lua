local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

gears = require("gears")
awful = require("awful")
beautiful = require("beautiful")
lain = require("lain")

hotkeys_popup = require("awful.hotkeys_popup").widget
my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

local naughty = require("naughty")
local dpi = require("beautiful.xresources").apply_dpi
local json = require("json")

---------------- Error handling ----------------

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify(
    {
      preset = naughty.config.presets.critical,
      title = "Oops, there were errors during startup!",
      text = awesome.startup_errors
    }
  )
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal(
    "debug::error",
    function(err)
      if in_error then
        return
      end
      in_error = true

      naughty.notify(
        {
          preset = naughty.config.presets.critical,
          title = "Oops, an error happened!",
          text = tostring(err)
        }
      )
      in_error = false
    end
  )
end

---------------- Autostart windowless processes ----------------

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
  for _, cmd in ipairs(cmd_arr) do
    awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
  end
end

run_once({"urxvtd", "unclutter -root"}) -- entries must be separated by commas

-- This function implements the XDG autostart specification
--[[
awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
    'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)
--]]

---------------- Variable definitions ----------------

config = json.load(os.getenv("HOME") .. "/.config/awesome/config.json")

modkey = config.keys.mod
altkey = config.keys.alt

terminal = config.default.terminal
editor = os.getenv("EDITOR") or config.default.editor
browser = config.default.browser
guieditor = config.default.guieditor
scrlocker = config.default.scrlocker

---------------- Layouts ----------------

awful.layout.layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  awful.layout.suit.max,
  awful.layout.suit.fair
  -- see https://awesomewm.org/apidoc/libraries/awful.layout.html#awful.layout.suit.
  -- and https://github.com/lcpz/lain/wiki/Layouts
}

lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol = 1
lain.layout.termfair.center.nmaster = 3
lain.layout.termfair.center.ncol = 1
lain.layout.cascade.tile.offset_x = dpi(2)
lain.layout.cascade.tile.offset_y = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster = 5
lain.layout.cascade.tile.ncol = 2

---------------- Theme ----------------

awful.util.terminal = terminal
awful.util.tagnames = config.tags.base

require("buttons.tags")
require("buttons.tasks")

local chosen_theme = config.theme

beautiful.init(string.format("%s/.config/awesome/copycats/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))

---------------- Menu ----------------
require("menu")

---------------- Screen ----------------

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal(
  "property::geometry",
  function(s)
    -- Wallpaper
    if beautiful.wallpaper then
      local wallpaper = beautiful.wallpaper
      -- If wallpaper is a function, call it with the screen
      if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
      end
      gears.wallpaper.maximized(wallpaper, s, true)
    end
  end
)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal(
  "arrange",
  function(s)
    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
      if only_one and not c.floating or c.maximized then
        c.border_width = 0
      else
        c.border_width = beautiful.border_width
      end
    end
  end
)

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(
  function(s)
    beautiful.at_screen_connect(s)
  end
)

---------------- Mouse bindings ----------------
require('buttons.root')
local clientbuttons = require('buttons.client')

---------------- Key bindings ----------------
require("keyboard.global")
local clientkeys = require("keyboard.client")

---------------- Rules ----------------

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      size_hints_honor = false
    }
  },
  -- Titlebars
  {
    rule_any = {type = {"dialog", "normal"}},
    properties = {titlebars_enabled = true}
  },
  {
    rule = {class = "Gimp", role = "gimp-image-window"},
    properties = {maximized = true}
  }
}

---------------- Signals ----------------
require("signals")

-- possible workaround for tag preservation when switching back to default screen:
-- https://github.com/lcpz/awesome-copycats/issues/251