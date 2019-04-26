local globalkeys =
  my_table.join(
  -- Take a screenshot
  -- https://github.com/lcpz/dots/blob/master/bin/screenshot
  awful.key(
    {altkey},
    "p",
    function()
      os.execute("screenshot")
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
  -- Hotkeys
  awful.key({modkey}, "s", hotkeys_popup.show_help, {description = "show help", group = "awesome"}),
  -- Tag browsing
  awful.key({modkey}, "Left", awful.tag.viewprev, {description = "view previous", group = "tag"}),
  awful.key({modkey}, "Right", awful.tag.viewnext, {description = "view next", group = "tag"}),
  awful.key({modkey}, "Escape", awful.tag.history.restore, {description = "go back", group = "tag"}),
  -- Non-empty tag browsing
  awful.key(
    {altkey},
    "Left",
    function()
      lain.util.tag_view_nonempty(-1)
    end,
    {description = "view  previous nonempty", group = "tag"}
  ),
  awful.key(
    {altkey},
    "Right",
    function()
      lain.util.tag_view_nonempty(1)
    end,
    {description = "view  previous nonempty", group = "tag"}
  ),
  -- Default client focus
  awful.key(
    {altkey},
    "j",
    function()
      awful.client.focus.byidx(1)
    end,
    {description = "focus next by index", group = "client"}
  ),
  awful.key(
    {altkey},
    "k",
    function()
      awful.client.focus.byidx(-1)
    end,
    {description = "focus previous by index", group = "client"}
  ),
  -- By direction client focus
  awful.key(
    {modkey},
    "j",
    function()
      awful.client.focus.global_bydirection("down")
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "focus down", group = "client"}
  ),
  awful.key(
    {modkey},
    "k",
    function()
      awful.client.focus.global_bydirection("up")
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "focus up", group = "client"}
  ),
  awful.key(
    {modkey},
    "h",
    function()
      awful.client.focus.global_bydirection("left")
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "focus left", group = "client"}
  ),
  awful.key(
    {modkey},
    "l",
    function()
      awful.client.focus.global_bydirection("right")
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "focus right", group = "client"}
  ),
  awful.key(
    {modkey},
    "w",
    function()
      awful.util.mymainmenu:show()
    end,
    {description = "show main menu", group = "awesome"}
  ),
  -- Layout manipulation
  awful.key(
    {modkey, "Shift"},
    "j",
    function()
      awful.client.swap.byidx(1)
    end,
    {description = "swap with next client by index", group = "client"}
  ),
  awful.key(
    {modkey, "Shift"},
    "k",
    function()
      awful.client.swap.byidx(-1)
    end,
    {description = "swap with previous client by index", group = "client"}
  ),
  awful.key(
    {modkey, "Control"},
    "j",
    function()
      awful.screen.focus_relative(1)
    end,
    {description = "focus the next screen", group = "screen"}
  ),
  awful.key(
    {modkey, "Control"},
    "k",
    function()
      awful.screen.focus_relative(-1)
    end,
    {description = "focus the previous screen", group = "screen"}
  ),
  awful.key({modkey}, "u", awful.client.urgent.jumpto, {description = "jump to urgent client", group = "client"}),
  awful.key(
    {modkey},
    "Tab",
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "go back", group = "client"}
  ),
  -- Show/Hide Wibox
  awful.key(
    {modkey},
    "b",
    function()
      for s in screen do
        s.mywibox.visible = not s.mywibox.visible
        if s.mybottomwibox then
          s.mybottomwibox.visible = not s.mybottomwibox.visible
        end
      end
    end,
    {description = "toggle wibox", group = "awesome"}
  ),
  -- On the fly useless gaps change
  awful.key(
    {altkey, "Control"},
    "+",
    function()
      lain.util.useless_gaps_resize(1)
    end,
    {description = "increment useless gaps", group = "tag"}
  ),
  awful.key(
    {altkey, "Control"},
    "-",
    function()
      lain.util.useless_gaps_resize(-1)
    end,
    {description = "decrement useless gaps", group = "tag"}
  ),
  -- Dynamic tagging
  awful.key(
    {modkey, "Shift"},
    "n",
    function()
      lain.util.add_tag()
    end,
    {description = "add new tag", group = "tag"}
  ),
  awful.key(
    {modkey, "Shift"},
    "r",
    function()
      lain.util.rename_tag()
    end,
    {description = "rename tag", group = "tag"}
  ),
  awful.key(
    {modkey, "Shift"},
    "Left",
    function()
      lain.util.move_tag(-1)
    end,
    {description = "move tag to the left", group = "tag"}
  ),
  awful.key(
    {modkey, "Shift"},
    "Right",
    function()
      lain.util.move_tag(1)
    end,
    {description = "move tag to the right", group = "tag"}
  ),
  awful.key(
    {modkey, "Shift"},
    "d",
    function()
      lain.util.delete_tag()
    end,
    {description = "delete tag", group = "tag"}
  ),
  -- custom tags
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
  ),
  -- Standard program
  awful.key(
    {modkey},
    "Return",
    function()
      awful.spawn(terminal)
    end,
    {description = "open a terminal", group = "launcher"}
  ),
  awful.key({modkey, "Control"}, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
  awful.key({modkey, "Shift"}, "q", awesome.quit, {description = "quit awesome", group = "awesome"}),
  awful.key(
    {altkey, "Shift"},
    "l",
    function()
      awful.tag.incmwfact(0.05)
    end,
    {description = "increase master width factor", group = "layout"}
  ),
  awful.key(
    {altkey, "Shift"},
    "h",
    function()
      awful.tag.incmwfact(-0.05)
    end,
    {description = "decrease master width factor", group = "layout"}
  ),
  awful.key(
    {modkey, "Shift"},
    "h",
    function()
      awful.tag.incnmaster(1, nil, true)
    end,
    {description = "increase the number of master clients", group = "layout"}
  ),
  awful.key(
    {modkey, "Shift"},
    "l",
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {description = "decrease the number of master clients", group = "layout"}
  ),
  awful.key(
    {modkey, "Control"},
    "h",
    function()
      awful.tag.incncol(1, nil, true)
    end,
    {description = "increase the number of columns", group = "layout"}
  ),
  awful.key(
    {modkey, "Control"},
    "l",
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    {description = "decrease the number of columns", group = "layout"}
  ),
  awful.key(
    {modkey},
    "space",
    function()
      awful.layout.inc(1)
    end,
    {description = "select next", group = "layout"}
  ),
  awful.key(
    {modkey, "Shift"},
    "space",
    function()
      awful.layout.inc(-1)
    end,
    {description = "select previous", group = "layout"}
  ),
  awful.key(
    {modkey, "Control"},
    "n",
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        client.focus = c
        c:raise()
      end
    end,
    {description = "restore minimized", group = "client"}
  ),
  -- Dropdown application
  awful.key(
    {modkey},
    "z",
    function()
      awful.screen.focused().quake:toggle()
    end,
    {description = "dropdown application", group = "launcher"}
  ),
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
  -- ALSA volume control
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
  ),
  -- MPD control
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
  ),
  -- User programs
  awful.key(
    {modkey},
    "q",
    function()
      awful.spawn(browser)
    end,
    {description = "run browser", group = "launcher"}
  ),
  awful.key(
    {modkey},
    "a",
    function()
      awful.spawn(guieditor)
    end,
    {description = "run gui editor", group = "launcher"}
  ),
  -- Prompt
  awful.key(
    {modkey},
    "r",
    function()
      awful.screen.focused().mypromptbox:run()
    end,
    {description = "run prompt", group = "launcher"}
  ),
  awful.key(
    {},
    "XF86Search",
    function()
      os.execute("rofi -combi-modi window,drun -show combi -modi combi")
    end,
    {description = "app launcher", group = "launcher"}
  ),
  awful.key(
    {modkey},
    "x",
    function()
      awful.prompt.run {
        prompt = "Run Lua code: ",
        textbox = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
      }
    end,
    {description = "lua execute prompt", group = "awesome"}
  )
  --]]
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 6 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus
  if i == 1 or i == 9 then
    descr_view = {description = "view tag #", group = "tag"}
    descr_toggle = {description = "toggle tag #", group = "tag"}
    descr_move = {description = "move focused client to tag #", group = "tag"}
    descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
  end
  globalkeys =
    my_table.join(
    globalkeys,
    -- View tag only.
    awful.key(
      {modkey},
      "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      descr_view
    ),
    -- Toggle tag display.
    awful.key(
      {modkey, "Control"},
      "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      descr_toggle
    ),
    -- Move client to tag.
    awful.key(
      {modkey, "Shift"},
      "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      descr_move
    ),
    -- Toggle tag on focused client.
    awful.key(
      {modkey, "Control", "Shift"},
      "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      descr_toggle_focus
    )
  )
end

-- Set keys
root.keys(globalkeys)
