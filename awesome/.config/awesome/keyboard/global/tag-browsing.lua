local lain = require("lain")

return tableCompat.join(
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
  )
)