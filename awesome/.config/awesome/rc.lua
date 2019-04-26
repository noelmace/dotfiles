local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

gears = require("gears")
awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
lain = require("lain")
local freedesktop = require("freedesktop")
hotkeys_popup = require("awful.hotkeys_popup").widget
require("awful.hotkeys_popup.keys")
my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
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

local config = json.load(os.getenv("HOME") .. "/.config/awesome/config.json")

local chosen_theme = config.theme

modkey = config.keys.mod
altkey = config.keys.alt

terminal = config.default.terminal
editor = os.getenv("EDITOR") or config.default.editor
browser = config.default.browser
guieditor = config.default.guieditor
scrlocker = config.default.scrlocker

awful.util.terminal = terminal

awful.util.tagnames = config.tags.base

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

awful.util.taglist_buttons =
  my_table.join(
  awful.button(
    {},
    1,
    function(t)
      t:view_only()
    end
  ),
  awful.button(
    {modkey},
    1,
    function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end
  ),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button(
    {modkey},
    3,
    function(t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end
  ),
  awful.button(
    {},
    4,
    function(t)
      awful.tag.viewnext(t.screen)
    end
  ),
  awful.button(
    {},
    5,
    function(t)
      awful.tag.viewprev(t.screen)
    end
  )
)

awful.util.tasklist_buttons =
  my_table.join(
  awful.button(
    {},
    1,
    function(c)
      if c == client.focus then
        c.minimized = true
      else
        --c:emit_signal("request::activate", "tasklist", {raise = true})<Paste>

        -- Without this, the following
        -- :isvisible() makes no sense
        c.minimized = false
        if not c:isvisible() and c.first_tag then
          c.first_tag:view_only()
        end
        -- This will also un-minimize
        -- the client, if needed
        client.focus = c
        c:raise()
      end
    end
  ),
  awful.button(
    {},
    2,
    function(c)
      c:kill()
    end
  ),
  awful.button(
    {},
    3,
    function()
      local instance = nil

      return function()
        if instance and instance.wibox.visible then
          instance:hide()
          instance = nil
        else
          instance = awful.menu.clients({theme = {width = dpi(250)}})
        end
      end
    end
  ),
  awful.button(
    {},
    4,
    function()
      awful.client.focus.byidx(1)
    end
  ),
  awful.button(
    {},
    5,
    function()
      awful.client.focus.byidx(-1)
    end
  )
)

lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol = 1
lain.layout.termfair.center.nmaster = 3
lain.layout.termfair.center.ncol = 1
lain.layout.cascade.tile.offset_x = dpi(2)
lain.layout.cascade.tile.offset_y = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster = 5
lain.layout.cascade.tile.ncol = 2

beautiful.init(string.format("%s/.config/awesome/copycats/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))

---------------- Menu ----------------

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

root.buttons(
  my_table.join(
    awful.button(
      {},
      3,
      function()
        awful.util.mymainmenu:toggle()
      end
    ),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
  )
)

---------------- Key bindings ----------------

require("keyboard.global")

local clientkeys = require("keyboard.client")
local clientbuttons = require('buttons.client')

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

-- Signal function to execute when a new client appears.
client.connect_signal(
  "manage",
  function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
    end
  end
)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal(
  "request::titlebars",
  function(c)
    -- Custom
    if beautiful.titlebar_fun then
      beautiful.titlebar_fun(c)
      return
    end

    -- Default
    -- buttons for the titlebar
    local buttons =
      my_table.join(
      awful.button(
        {},
        1,
        function()
          c:emit_signal("request::activate", "titlebar", {raise = true})
          awful.mouse.client.move(c)
        end
      ),
      awful.button(
        {},
        2,
        function()
          c:kill()
        end
      ),
      awful.button(
        {},
        3,
        function()
          c:emit_signal("request::activate", "titlebar", {raise = true})
          awful.mouse.client.resize(c)
        end
      )
    )

    awful.titlebar(c, {size = dpi(12)}):setup {
      {
        -- Left
        awful.titlebar.widget.iconwidget(c),
        buttons = buttons,
        layout = wibox.layout.fixed.horizontal
      },
      {
        -- Middle
        buttons = buttons,
        layout = wibox.layout.flex.horizontal
      },
      {
        -- Right
        awful.titlebar.widget.floatingbutton(c),
        awful.titlebar.widget.maximizedbutton(c),
        awful.titlebar.widget.stickybutton(c),
        awful.titlebar.widget.ontopbutton(c),
        awful.titlebar.widget.closebutton(c),
        layout = wibox.layout.fixed.horizontal()
      },
      layout = wibox.layout.align.horizontal
    }
  end
)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
  "mouse::enter",
  function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = true})
  end
)

client.connect_signal(
  "focus",
  function(c)
    c.border_color = beautiful.border_focus
  end
)
client.connect_signal(
  "unfocus",
  function(c)
    c.border_color = beautiful.border_normal
  end
)

-- possible workaround for tag preservation when switching back to default screen:
-- https://github.com/lcpz/awesome-copycats/issues/251