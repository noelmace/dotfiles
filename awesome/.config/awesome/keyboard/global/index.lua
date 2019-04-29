local hotkeys_popup = require("awful.hotkeys_popup").widget
local lain = require("lain")
local beautiful = require("beautiful")
local gears = require("gears")

local alsaVolume = require("keyboard.global.alsa-volume")
local apps = require("keyboard.global.apps")
local awesome = require("keyboard.global.awesome")
local clientFocus = require("keyboard.global.client-focus")
local dynamicTaging = require("keyboard.global.dynamic-tagging")
local hotkeys = require("keyboard.global.hotkeys")
local layoutManipulation = require("keyboard.global.layout-manipulation")
local mpdControl = require("keyboard.global.mpd-control")
local numKeys = require("keyboard.global.num-keys")
local prompt = require("keyboard.global.prompt")
local tagBrowsing = require("keyboard.global.tag-browsing")
local tagsWithClient = require("keyboard.global.tags-with-client")
local widgets = require("keyboard.global.widgets")

return tableCompat.join(
  alsaVolume,
  apps,
  awesome,
  clientFocus,
  dynamicTaging,
  hotkeys,
  layoutManipulation,
  mpdControl,
  numKeys,
  prompt,
  tagBrowsing,
  tagsWithClient,
  widgets
)
