local hotkeys_popup = require("awful.hotkeys_popup").widget

return tableCompat.join(
  awful.key({modkey}, "s", hotkeys_popup.show_help, {description = "show help", group = "awesome"}),
  awful.key({modkey, "Control"}, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
  awful.key({modkey, "Shift"}, "q", awesome.quit, {description = "quit awesome", group = "awesome"}),
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
  awful.key(
    {modkey},
    "w",
    function()
      awful.util.mymainmenu:show()
    end,
    {description = "show main menu", group = "awesome"}
  )
)
