return tableCompat.join(
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
)