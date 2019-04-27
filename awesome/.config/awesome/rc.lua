local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

awful = require("awful")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

local gears = require("gears")
local beautiful = require("beautiful")
local lain = require("lain")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local naughty = require("naughty")
local dpi = require("beautiful.xresources").apply_dpi
local json = require("json")

tableCompat = awful.util.table or gears.table -- 4.{0,1} compatibility

---------------- GLOBAL config ----------------

config = json.load(os.getenv("HOME") .. "/.config/awesome/config.json")

modkey = config.keys.mod
altkey = config.keys.alt

terminal = config.default.terminal
editor = os.getenv("EDITOR") or config.default.editor
browser = config.default.browser
guieditor = config.default.guieditor
scrlocker = config.default.scrlocker

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

if (config.xdgAutostart) then
  -- This function implements the XDG autostart specification
  awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
      'xrdb -merge <<< "awesome.started:true";' ..
        -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
        'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
  )
end

---------------- Layouts ----------------

awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.top,
  awful.layout.suit.floating,
  awful.layout.suit.max
  -- see https://awesomewm.org/apidoc/libraries/awful.layout.html#awful.layout.suit.
  -- and https://github.com/lcpz/lain/wiki/Layouts
}

---------------- Theme ----------------

awful.util.terminal = terminal
awful.util.tagnames = config.tags.base

awful.util.taglist_buttons = require("buttons.tags")
awful.util.tasklist_buttons = require("buttons.tasks")

local chosen_theme = config.theme

beautiful.init(string.format("%s/.config/awesome/copycats/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))

----------------

require("menu")

require("screen")

-- mouse bindings
local globalButtons = require("buttons.root")
root.buttons(globalButtons)

-- key bindings
local globalKeys = require("keyboard.global.index")
root.keys(globalKeys)

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = require("rules")

require("signals")

-- possible workaround for tag preservation when switching back to default screen:
-- https://github.com/lcpz/awesome-copycats/issues/251
