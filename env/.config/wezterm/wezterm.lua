local wezterm = require 'wezterm'
local colors= require 'colors'

local config = {}
config.default_prog = { 'zsh', '-l' } --config.font = wezterm.font 'Classic Console' config.font_size = 15 config.font = wezterm.font 'Source Code Pro'
config.enable_tab_bar = false

config.font = wezterm.font_with_fallback {
    'B612 Mono',
    --'Inconsolata',
    --  'CozetteVector', --has weird offset with japanese. きki becomes せse and vice versa
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

return config
