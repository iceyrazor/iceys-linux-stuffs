local wezterm = require 'wezterm'
local config = {}
local act = wezterm.action

config.default_prog = { 'zsh', '-l' }

--config.font = wezterm.font 'Classic Console'
--config.font_size = 15
--config.font = wezterm.font 'Source Code Pro'
config.show_tabs_in_tab_bar = false
config.enable_tab_bar = false
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
    --background = '#101010',
    background = '#04000a',
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

local function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
--[[
wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config2, hover, max_width)
    local edge_background = '#0b0022'
    local background = '#1b1032'
    local foreground = '#808080'

    if tab.is_active then
      background = '#2b2042'
      foreground = '#c0c0c0'
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)
--]]

return config
