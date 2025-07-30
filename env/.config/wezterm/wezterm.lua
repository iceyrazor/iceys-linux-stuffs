local wezterm = require 'wezterm'
local colors= require 'colors'

local config = {}
--config.font = wezterm.font 'Classic Console' config.font_size = 15 config.font = wezterm.font 'Source Code Pro'
config.set_environment_variables = {
  wezterm = 'yes',
}
config.enable_tab_bar = false

config.font = wezterm.font_with_fallback {
    'B612 Mono',
    'JetBrainsMono',
    'JetBrainsMono Nerd Font',
    'JetBrainsMono Nerd Font Mono',
    'IPAGothic',
    'FreeMono',
}
config.font_size = 13

config.colors=colors

config.window_background_opacity = 0.8

config.unix_domains = {
  {
    name = 'unix',
    no_serve_automatically = false,
  },
}

config.front_end = "OpenGL"

return config
