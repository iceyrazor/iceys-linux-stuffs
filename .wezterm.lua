local wezterm = require 'wezterm'
local config = {}
local act = wezterm.action

--config.font = wezterm.font 'Classic Console'
--config.font_size = 15
--config.font = wezterm.font 'Source Code Pro'
config.font = wezterm.font 'CozetteVector'
config.font_size = 15

config.keys = {
    { key = 'h', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
    { key = 'h', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Left', 1 } },
    { key = 'l', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
    { key = 'l', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Right', 1 } },
    { key = 'k', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
    { key = 'k', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Up', 1 } },
    { key = 'j', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
    { key = 'j', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Down', 1 } },
}

config.colors={
    foreground = '#e6e6e6',
    background = '#101010',
    cursor_fg = '#fabd2f',
    ansi = {
        '#263640',
        '#d12f2c',
        '#819400',
        '#b08500',
        '#2587cc',
        '#696ebf',
        '#289c93',
        '#bfbaac',
    },
    brights = {
        '#4a697d',
        '#fa3935',
        '#a4bd00',
        '#d9a400',
        '#09a2f5',
        '#8086e8',
        '#00c5ba',
        '#fdf6e3',
    },
}

config.window_background_opacity = 0.8

return config
