local colors = require 'colors'
local icons = require 'icons'
local settings = require 'settings'

local event = sbar.add('event', 'input_change', 'AppleSelectedInputSourcesChangedNotification')

local lang = sbar.add('item', 'widgets.lang', {
  position = 'right',
  icon = { drawing = false },
  label = { width = 25, align = 'left', font = { style = settings.font.style_map['Regular'], size = 14.0 }, string = icons.lang.unknown },
  background = { color = colors.bg1 },
})

lang:subscribe('input_change', function()
  sbar.exec('defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID', function(layout)
    local icon = icons.lang.unknown
    layout = layout:gsub('\n$', '')
    local layoutName = layout:match '%.(%w+)$'

    if layoutName == 'ABC' then
      icon = icons.lang.en
    elseif layoutName == 'RussianWin' then
      icon = icons.lang.ru
    end

    lang:set {
      label = icon,
    }
  end)
end)
sbar.trigger(event)
