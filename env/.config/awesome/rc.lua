-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

Us_keys = require("keys-US")
Us_keys_colemak = require("keys-US-colemak")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local HOMEDIR="/home/iceyrazor/"


local show_desktop = false
function show_my_desktop()
    if show_desktop then
        for _, c in ipairs(client.get()) do
            c:emit_signal(
                "request::activate", "key.unminimize", {raise = true}
            )
        end
        show_desktop = false
    else
        for _, c in ipairs(client.get()) do
            c.minimized = true
        end
        show_desktop = true
    end
end

--auto switch to tag with clients if no current clients exist in current tag
--[[
client.connect_signal("unmanage", function(c)
    local t = c.first_tag or awful.screen.focused().selected_tag
    for _, cl in ipairs(t:clients()) do
        if cl ~= c then
            return
        end
    end
    for _, t in ipairs(awful.screen.focused().tags) do
        if #t:clients() > 0 then
            t:view_only()
            return
        end
    end
end)
]]--


-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
--beautiful.init(gears.filesystem.get_themes_dir() .. "openSUSE/theme.lua")
beautiful.init(gears.filesystem.get_configuration_dir() .. "iceys-theme/theme.lua")


-- This is used later as the default terminal and editor to run.
terminal = "wezterm"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"


-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}



-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = {
    { "awesome", myawesomemenu, beautiful.awesome_icon },
    { "open terminal", terminal }
}})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock("%a %m/%d/%Y %I:%M%p")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end)
)

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(screen)
    -- Wallpaper
    set_wallpaper(screen)

    -- Each screen has its own tag table.
    --awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[2])
    --awful.tag({ "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  " }, s, awful.layout.layouts[2])
    awful.tag({ "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  " }, screen, awful.layout.layouts[2])

    -- Create a promptbox for each screen
    screen.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    screen.mylayoutbox = awful.widget.layoutbox(screen)
    screen.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    screen.mytaglist = awful.widget.taglist {
        screen  = screen,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    screen.mytasklist = awful.widget.tasklist {
        screen  = screen,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }


    -- Create the wibox
    screen.mywibox = awful.wibar({ position = "bottom", screen = screen , height = 20, width = 1500, y = screen.geometry.height - 24 - 500})
    awful.placement.bottom(screen.mywibox, { margins = { bottom = 2, top = 20 } })


    local spacer = wibox.widget.textbox("  ")
    local spacerbg = wibox.widget.textbox("  ")
    local spacerbg= wibox.widget.background(spacerbg)
    spacerbg.bg = beautiful.bg_normal

    screen.mywibox.bg = beautiful.wibar_background
    screen.mywibox.ontop = false
    screen.mywibox.floating = false

    local mykeyboardlayout = wibox.widget.background(mykeyboardlayout)
    mykeyboardlayout.bg = beautiful.bg_normal

    local myLayoutBox = wibox.widget.background(screen.mylayoutbox)
    myLayoutBox.bg = beautiful.bg_normal

    local mytextclock = wibox.widget.background(mytextclock)
    mytextclock.bg = beautiful.bg_normal

    -- Add widgets to the wibox
    if screen.index==1 then
        local stbar = awful.widget.watch(HOMEDIR..'.local/bin/system/stbar/stbar-awesome.sh', 2)
        local stbar = wibox.widget.background(stbar)
        stbar.bg = beautiful.bg_normal

        screen.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                -- mylauncher,
                screen.mytaglist,
                screen.mypromptbox,
                spacer,
            },
            screen.mytasklist, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                spacer,
                mykeyboardlayout,
                stbar,
                mytextclock,
                spacerbg,
                spacer,
                spacerbg,
                wibox.widget.systray(),
                spacerbg,
                spacer,
                myLayoutBox,
            },
        }
    else
        screen.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                -- mylauncher,
                screen.mytaglist,
                screen.mypromptbox,
            },
            screen.mytasklist, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                mykeyboardlayout,
                mytextclock,
                -- wibox.widget.systray(),
                screen.mylayoutbox,
            },
        }
    end


    -- Add widgets to the wibox
    --[[
    if s.index == 1 then
        local new_wi = awful.wibar({ position = "bottom", screen = 1 , width = 200, height = 20})
        new_wi:setup {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                -- mylauncher,
                mytextclock,
            }
        }
    end
    ]]--
end)

local month_calendar = awful.widget.calendar_popup.month({start_sunday=true})
month_calendar:attach( mytextclock, "br" )
--mytextclock:connect_signal("button::press",function ()
--end)

-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}


--set keymap based on keyboard layout
if mykeyboardlayout._layout[1] == "us" then
    Us_keys.set_global_keys()
    Us_keys.set_client_keys()
else
    Us_keys_colemak.set_global_keys()
    Us_keys_colemak.set_client_keys()
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({modkey}, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({modkey}, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c, "bottomright") --corner bonked
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}


-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "nheko",
          "Wpa_gui",
          "Pcmanfm",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
          "Vivecraft*",
          "Mivecraft*",
          "LinVAM",
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

    --[[
    { rule_any = {
        class = { "Mumble", "Gajim", "vesktop" }
        },
        properties = { floating = true, screen = 2 }
    },
    --]]

    { rule_any = {
        class = { "steam_app*", "vesktop", "Minecraft*" }
        },
        properties = { border_width = 0 }
    },

    {
        rule = { name = "im-emoji-picker" },
        properties = {
            focusable = false,
            focus = false,
        }
    }

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}
if screen[2] then
    table.insert(awful.rules.rules,
    { rule_any = {
            class = { "Mumble", "gajim", "vesktop" }
        },
        properties = { floating = true, screen = 2 }
    }
)
end

client.connect_signal("manage", function(c)
    if c.name == "im-emoji-picker" then
        local focused = client.focus
        if focused and focused ~= c then
            -- Center on focused client
            local geo = focused:geometry()
            local c_geo = c:geometry()

            c:geometry({
                x = geo.x + (geo.width - c_geo.width) / 2,
                y = geo.y + (geo.height - c_geo.height) / 2
            })
        else
            -- Fallback: center on screen
            awful.placement.centered(c, nil)
        end
    end
end)

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

awful.layout.suit.tile.master_width_factor = 0.5

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
--[[
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
]]

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}


-- autostart applets
awful.spawn.with_shell("~/.local/bin/system/start-scripts/autostart.sh")
