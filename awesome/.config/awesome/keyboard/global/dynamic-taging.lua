local lain = require("lain")

return tableCompat.join(
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
    {description = "move tag to the left", group = "dynamic tag"}
  ),
  awful.key(
    {modkey, "Shift"},
    "Right",
    function()
      lain.util.move_tag(1)
    end,
    {description = "move tag to the right", group = "dynamic tag"}
  ),
  awful.key(
    {modkey, "Shift"},
    "d",
    function()
      lain.util.delete_tag()
    end,
    {description = "delete tag", group = "dynamic tag"}
  )
)
