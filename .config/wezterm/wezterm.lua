local wezterm = require 'wezterm'

local config = {}
local act = wezterm.action
config.default_prog = { 'zsh', '-l' } --config.font = wezterm.font 'Classic Console' config.font_size = 15 config.font = wezterm.font 'Source Code Pro'
-- tab bar
config.enable_tab_bar = false
--config.hide_tab_bar_if_only_one_tab = false
--config.tab_bar_at_bottom = true
--config.use_fancy_tab_bar = false
--config.show_tabs_in_tab_bar = true
--config.show_new_tab_button_in_tab_bar = false
--config.tab_and_split_indices_are_zero_based = true
--config.font = wezterm.font 'CozetteVector'


-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
--[[
if wezterm.config_builder then
    config = wezterm.config_builder()
end
--]]

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
--config.font = wezterm.font 'Inconsolata'
config.font_size = 13
--config.font = wezterm.font 'Caesar Dressing'
--config.font_size = 13

--config.window_background_image = "/home/iceyrazor/stuff/media/wallpapers/hfdsjkldysa87gr9eahgf4rjek ltjkedjkaslfjd salk 9270221.jpg"
--[[
config.window_background_image_hsb = {
    -- Darken the background image by reducing it to 1/3rd
    brightness = 0.05,

    -- You can adjust the hue by scaling its value.
    -- a multiplier of 1.0 leaves the value unchanged.
    hue = 1.0,

    -- You can adjust the saturation also.
    saturation = 1.0,
}
]]--

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

--[[
local keysmain = {
    { key = 'h', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
    { key = 'h', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Left', 1 } },
    { key = 'l', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
    { key = 'l', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Right', 1 } },
    { key = 'k', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
    { key = 'k', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Up', 1 } },
    { key = 'j', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
    { key = 'j', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Down', 1 } },
}
]]--

-- WezTerm Keybindings Documentation by dragonlobster 
-- ===================================================
-- Leader Key:
-- The leader key is set to ALT + q, with a timeout of 2000 milliseconds (2 seconds).
-- To execute any keybinding, press the leader key (ALT + q) first, then the corresponding key.

-- Keybindings:
-- 1. Tab Management:
--    - LEADER + c: Create a new tab in the current pane's domain.
--    - LEADER + x: Close the current pane (with confirmation).
--    - LEADER + b: Switch to the previous tab.
--    - LEADER + n: Switch to the next tab.
--    - LEADER + <number>: Switch to a specific tab (0–9).

-- 2. Pane Splitting:
--    - LEADER + |: Split the current pane horizontally into two panes.
--    - LEADER + -: Split the current pane vertically into two panes.

-- 3. Pane Navigation:
--    - LEADER + h: Move to the pane on the left.
--    - LEADER + j: Move to the pane below.
--    - LEADER + k: Move to the pane above.
--    - LEADER + l: Move to the pane on the right.

-- 4. Pane Resizing:
--    - LEADER + LeftArrow: Increase the pane size to the left by 5 units.
--    - LEADER + RightArrow: Increase the pane size to the right by 5 units.
--    - LEADER + DownArrow: Increase the pane size downward by 5 units.
--    - LEADER + UpArrow: Increase the pane size upward by 5 units.

-- 5. Status Line:
--    - The status line indicates when the leader key is active, displaying an ocean wave emoji (🌊).

-- Miscellaneous Configurations:
-- - Tabs are shown even if there's only one tab.
-- - The tab bar is located at the bottom of the terminal window.
-- - Tab and split indices are zero-based.

-- For example, changing the color scheme:
-- config.color_scheme = "Catppuccin Macchiato"
-- config.window_decorations = "RESIZE"

-- tmux
config.leader = { key = "Space", mods = "SHIFT", timrout_milliseconds = 20000 }
config.keys = {
    {
        mods = "LEADER",
        key = "c",
        action = wezterm.action.SpawnTab "CurrentPaneDomain",
    },
    {
        mods = "LEADER",
        key = "x",
        action = wezterm.action.CloseCurrentPane { confirm = true }
    },
    {
        mods = "LEADER",
        key = "b",
        action = wezterm.action.ActivateTabRelative(-1)
    },
    {
        mods = "LEADER",
        key = "n",
        action = wezterm.action.ActivateTabRelative(1)
    },
    {
        mods = "LEADER",
        key = "\\",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
    },
    {
        mods = "LEADER",
        key = "-",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
    },
    {
        mods = "LEADER",
        key = "h",
        action = wezterm.action.ActivatePaneDirection "Left"
    },
    {
        mods = "LEADER",
        key = "j",
        action = wezterm.action.ActivatePaneDirection "Down"
    },
    {
        mods = "LEADER",
        key = "k",
        action = wezterm.action.ActivatePaneDirection "Up"
    },
    {
        mods = "LEADER",
        key = "l",
        action = wezterm.action.ActivatePaneDirection "Right"
    },
    {
        mods = "LEADER",
        key = "LeftArrow",
        action = wezterm.action.AdjustPaneSize { "Left", 5 }
    },
    {
        mods = "LEADER",
        key = "RightArrow",
        action = wezterm.action.AdjustPaneSize { "Right", 5 }
    },
    {
        mods = "LEADER",
        key = "DownArrow",
        action = wezterm.action.AdjustPaneSize { "Down", 5 }
    },
    {
        mods = "LEADER",
        key = "UpArrow",
        action = wezterm.action.AdjustPaneSize { "Up", 5 }
    },
}

for i = 1, 9 do
    -- leader + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = wezterm.action.ActivateTab(i-1),
    })
end


-- tmux status
wezterm.on("update-right-status", function(window, _)
    local SOLID_LEFT_ARROW = ""
    --local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
    -- local ARROW_FOREGROUND = { Foreground = { Color = "#000000" } }
    local prefix = ""

    if window:leader_is_active() then
        prefix = " " .. utf8.char(0x1f30a) -- ocean wave
        SOLID_LEFT_ARROW = utf8.char(0xe0b2)
    end

    if window:active_tab():tab_id() ~= 0 then
        -- ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
        -- ARROW_FOREGROUND = { Foreground = { Color = "#000000" } }
    end -- arrow color based on if tab is first pane

    window:set_left_status(wezterm.format {
        --{ Background = { Color = "#b7bdf8" } },
        -- { Background = { Color = "#000000" } },
        { Text = prefix },
        ARROW_FOREGROUND,
        { Text = SOLID_LEFT_ARROW }
    })
end)


config.unix_domains = {
  {
    name = 'unix',
    no_serve_automatically = false,
  },
}

-- This causes `wezterm` to act as though it was started as
-- `wezterm connect unix` by default, connecting to the unix
-- domain on startup.
-- If you prefer to connect manually, leave out this line.
-- config.default_gui_startup_args = { 'connect', 'unix' }

return config
