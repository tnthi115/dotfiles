-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'GruvboxDarkHard'

config.font = wezterm.font_with_fallback {
  "CaskaydiaCove Nerd Font",
  "Hack Nerd Font",
  "Symbols Nerd Font"
}
config.font_size = 12.5

config.enable_tab_bar = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 2,
  bottom = 0,
}

config.window_background_opacity = .93

-- and finally, return the configuration to wezterm
return config
