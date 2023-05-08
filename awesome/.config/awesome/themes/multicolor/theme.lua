--[[

     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local theme_assets = require("beautiful.theme_assets")

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local colors                                    = {}
-- gruvbox material
-- -- colors.red                                      = "#f2594b"
-- colors.red                                      = "#ea6962"
-- colors.green                                    = "#b0b846"
-- colors.yellow                                   = "#e3a84e"
-- colors.blue                                     = "#80aa93"
-- colors.magenta                                  = "#d3869b"
-- colors.cyan                                     = "#8bba7f"

-- tokyonight night
colors.red                                      = "#f7768e"
colors.green                                    = "#9ece6a"
colors.yellow                                   = "#e0af68"
colors.blue                                     = "#7aa2f7"
colors.magenta                                  = "#bb9af7"
colors.cyan                                     = "#7dcfff"

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/multicolor"
-- theme.wallpaper                                 = theme.confdir .. "/wall.png"
-- theme.font                                      = "Hack Nerd Font Regular 9"
theme.font                                      = "CaskaydiaCove Nerd Font 9.5"
theme.icon_theme                                = nil
-- theme.menu_bg_normal                            = "#000000"
-- theme.menu_bg_focus                             = "#000000"
-- theme.bg_normal                                 = "#000000"
-- theme.bg_normal                                 = "#000000"
-- theme.bg_focus                                  = "#000000"
-- theme.bg_urgent                                 = "#000000"
-- theme.fg_normal                                 = "#aaaaaa"
-- theme.fg_focus                                  = "#ff8c00"
-- theme.fg_urgent                                 = "#af1d18"
-- theme.fg_minimize                               = "#ffffff"

-- Gruvbox Material
-- theme.bg_normal                                 = "#1d2021"
-- theme.bg_focus                                  = "#282828"
-- theme.bg_urgent                                 = "#f2594b"
-- -- theme.bg_minimize                               = "#1c1920"
-- -- theme.bg_minimize                               = "#1c1920"
-- theme.bg_systray                                = theme.bg_normal
-- -- theme.fg_normal                                 = "#aaaaaa"
-- -- theme.fg_focus                                  = "#ffffff"
-- -- theme.fg_urgent                                 = "#ffffff"
-- -- theme.fg_minimize                               = "#999999"
-- theme.fg_normal   = "#a89984"
-- theme.fg_focus    = "#e2cca9"
-- theme.fg_urgent    = "#f2e5bc"
-- theme.fg_minimize = "#928374"
-- theme.border_focus                              = "#6e635d"
-------------------

-- Tokynight Night
theme.bg_normal                                 = "#16161e"
theme.bg_focus                                  = "#1a1b26"
theme.bg_urgent                                 = "#db4b4b"
theme.bg_systray                                = theme.bg_normal
-- theme.fg_normal                                 = "#aaaaaa"
-- theme.fg_focus                                  = "#ffffff"
-- theme.fg_urgent                                 = "#ffffff"
-- theme.fg_minimize                               = "#999999"
theme.fg_normal                                 = "#565f89"
theme.fg_focus                                  = "#c0caf5"
theme.fg_urgent                                 = "#ffffff"
theme.fg_minimize                               = "#545c7e"
theme.border_focus                              = "#545c7e"
------------------

theme.border_width                              = dpi(1)
-- theme.border_normal                             = "#1c2022"
-- theme.border_focus                              = "#606060"
-- theme.border_marked                             = "#3ca4d8"
theme.border_normal                             = "#000000"
theme.border_marked                             = "#91231c"
theme.menu_border_width                         = 0
-- theme.menu_height                               = dpi(15)
theme.menu_width                                = dpi(150)
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
-- theme.menu_fg_normal                            = "#aaaaaa"
-- theme.menu_fg_focus                             = "#ff8c00"
-- theme.menu_bg_normal                            = "#050505dd"
-- theme.menu_bg_focus                             = "#050505dd"
-- theme.widget_temp                               = theme.confdir .. "/icons/temp.png"
-- theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                = gears.color.recolor_image(theme.confdir .. "/icons/cpu.png", colors.red)
-- theme.widget_weather                            = theme.confdir .. "/icons/dish.png"
-- theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
-- theme.widget_mem                                = theme.confdir .. "/icons/mem.png"
theme.widget_mem                                = gears.color.recolor_image(theme.confdir .. "/icons/mem.png", colors.green)
theme.widget_note                               = theme.confdir .. "/icons/note.png"
theme.widget_note_on                            = theme.confdir .. "/icons/note_on.png"
-- theme.widget_netdown                            = theme.confdir .. "/icons/net_down.png"
theme.widget_netdown                            = gears.color.recolor_image(theme.confdir .. "/icons/net_down.png", colors.cyan)
-- theme.widget_netup                              = theme.confdir .. "/icons/net_up.png"
theme.widget_netup                              = gears.color.recolor_image(theme.confdir .. "/icons/net_up.png", colors.magenta)
theme.widget_mail                               = theme.confdir .. "/icons/mail.png"
theme.widget_batt                               = theme.confdir .. "/icons/bat.png"
theme.widget_clock                              = gears.color.recolor_image(theme.confdir .. "/icons/clock.png", colors.blue)
theme.widget_vol                                = gears.color.recolor_image(theme.confdir .. "/icons/spkr.png", colors.yellow)
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)
-- theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
-- theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_b.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = dpi(5)
theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
-- local mytextclock = wibox.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#ab7367", ">") .. markup("#de5e1e", " %H:%M "))
-- local mytextclock = wibox.widget.textclock(markup("#80aa9e", "%A %b %d") .. markup("#d3869b", ",") .. markup("#f2594b", " %H:%M "))
-- local mytextclock = wibox.widget.textclock(markup(theme.fg_normal, "%A %b %d") .. markup(theme.fg_normal, ",") .. markup(theme.fg_normal, " %H:%M "))
local mytextclock = wibox.widget.textclock()
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Terminus 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Weather
--[[ to be set before use
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather({
    city_id = 2643743, -- placeholder (London)
    notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, "#eca4c4", "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, "#eca4c4", descr .. " @ " .. units .. "°C "))
    end
})
--]]

-- / fs
-- commented because it needs Gio/Glib >= 2.54
-- local fsicon = wibox.widget.imagebox(theme.widget_fs)
-- theme.fs = lain.widget.fs({
--     notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
--     settings  = function()
--         -- widget:set_markup(markup.fontfg(theme.font, "#80d9d8", string.format("%.1f", fs_now["/"].used) .. "% "))
--         widget:set_markup(markup.fontfg(theme.font, "#e3a84e", string.format("%.1f", fs_now["/home"].used) .. "% "))
--     end
-- })

-- Mail IMAP check
--[[ to be set before use
local mailicon = wibox.widget.imagebox()
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            mailicon:set_image(theme.widget_mail)
            widget:set_markup(markup.fontfg(theme.font, "#cccccc", mailcount .. " "))
        else
            widget:set_text("")
            --mailicon:set_image() -- not working in 4.0
            mailicon._private.image = nil
            mailicon:emit_signal("widget::redraw_needed")
            mailicon:emit_signal("widget::layout_changed")
        end
    end
})
--]]

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        -- widget:set_markup(markup.fontfg(theme.font, "#e33a6e", cpu_now.usage .. "% "))
        widget:set_markup(markup.fontfg(theme.font, colors.red, cpu_now.usage .. "% "))
    end
})

-- Coretemp
-- local tempicon = wibox.widget.imagebox(theme.widget_temp)
-- local temp = lain.widget.temp({
--     settings = function()
--         -- widget:set_markup(markup.fontfg(theme.font, "#f1af5f", coretemp_now .. "°C "))
--         widget:set_markup(markup.fontfg(theme.font, "#e3a84e", coretemp_now .. "°C "))
--     end
-- })

-- Battery widget
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")

-- Logout menu widget
-- local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")

-- Battery
-- local baticon = wibox.widget.imagebox(theme.widget_batt)
-- local bat = lain.widget.bat({
--     settings = function()
--         local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc

--         if bat_now.ac_status == 1 then
--             perc = perc .. " plug"
--         end

--         widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, perc .. " "))
--     end
-- })

-- Volume widget
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')

-- ALSA volume
-- local volicon = wibox.widget.imagebox(theme.widget_vol)
-- theme.volume = lain.widget.alsa({
--     settings = function()
--         if volume_now.status == "off" then
--             volume_now.level = volume_now.level .. "M"
--         end

--         -- widget:set_markup(markup.fontfg(theme.font, "#7493d2", volume_now.level .. "% "))
--         -- widget:set_markup(markup.fontfg(theme.font, "#80aa9e", volume_now.level .. "% "))
--         widget:set_markup(markup.fontfg(theme.font, colors.yellow, volume_now.level .. "% "))
--         -- widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, volume_now.level .. "% "))
--     end
-- })

-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        --[[ uncomment if using the weather widget
        if iface ~= "network off" and
           string.match(theme.weather.widget.text, "N/A")
        then
            theme.weather.update()
        end
        --]]

        -- widget:set_markup(markup.fontfg(theme.font, "#e54c62", net_now.sent .. " "))
        widget:set_markup(markup.fontfg(theme.font, colors.magenta, net_now.sent .. " "))
        -- netdowninfo:set_markup(markup.fontfg(theme.font, "#87af5f", net_now.received .. " "))
        netdowninfo:set_markup(markup.fontfg(theme.font, colors.cyan, net_now.received .. " "))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem({
    settings = function()
        -- widget:set_markup(markup.fontfg(theme.font, "#e0da37", mem_now.used .. "M "))
        widget:set_markup(markup.fontfg(theme.font, colors.green, mem_now.used .. "M "))
    end
})

-- MPD
-- local mpdicon = wibox.widget.imagebox()
-- theme.mpd = lain.widget.mpd({
--     settings = function()
--         mpd_notification_preset = {
--             text = string.format("%s [%s] - %s\n%s", mpd_now.artist,
--                    mpd_now.album, mpd_now.date, mpd_now.title)
--         }

--         if mpd_now.state == "play" then
--             artist = mpd_now.artist .. " > "
--             title  = mpd_now.title .. " "
--             mpdicon:set_image(theme.widget_note_on)
--         elseif mpd_now.state == "pause" then
--             artist = "mpd "
--             title  = "paused "
--         else
--             artist = ""
--             title  = ""
--             --mpdicon:set_image() -- not working in 4.0
--             mpdicon._private.image = nil
--             mpdicon:emit_signal("widget::redraw_needed")
--             mpdicon:emit_signal("widget::layout_changed")
--         end
--         -- widget:set_markup(markup.fontfg(theme.font, "#e54c62", artist) .. markup.fontfg(theme.font, "#b2b2b2", title))
--         widget:set_markup(markup.fontfg(theme.font, colors.magenta, artist) .. markup.fontfg(theme.font, "#b2b2b2", title))
--     end
-- })

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    -- local wallpaper = theme.wallpaper
    -- if type(wallpaper) == "function" then
    --     wallpaper = wallpaper(s)
    -- end
    -- gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    -- s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(19), bg = theme.bg_normal, fg = theme.fg_normal })
    s.mywibox = awful.wibar({ position = "top", screen = s, bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --s.mylayoutbox,
            -- logout_menu_widget,
            s.mytaglist,
            s.mypromptbox,
            -- mpdicon,
            -- theme.mpd.widget,
        },
        s.mytasklist, -- Middle widget
        -- nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            --mailicon,
            --theme.mail.widget,
            netdownicon,
            netdowninfo,
            netupicon,
            netupinfo.widget,
            memicon,
            memory.widget,
            cpuicon,
            cpu.widget,
            -- fsicon,
            -- theme.fs.widget,
            --weathericon,
            --theme.weather.widget,
            -- tempicon,
            -- temp.widget,
            -- volicon,
            -- theme.volume.widget,
            volume_widget({
              widget_type = "icon_and_text",
              step = "2",
              -- main_color = theme.fg_normal,
              -- mute_color = theme.bg_normal,
              -- with_icon = true,
              font = "Hack Nerd Font 9",
            }),
            -- baticon,
            battery_widget({
              font = "Hack Nerd Font 9",
              path_to_icons = "/usr/share/icons/Arc/status/symbolic/",
              show_current_level = true,
              margin_left = 5,
              margin_right = 7,
              display_notification = true,
              warning_msg_position = top_right,
              enable_battery_warning = true,
            }),
            -- bat.widget,
            clockicon,
            mytextclock,
            s.mylayoutbox,
        },
    }

    -- Create the bottom wibox
    -- s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = 0, height = dpi(20), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the bottom wibox
    -- s.mybottomwibox:setup {
    --     layout = wibox.layout.align.horizontal,
    --     { -- Left widgets
    --         layout = wibox.layout.fixed.horizontal,
    --     },
    --     s.mytasklist, -- Middle widget
    --     { -- Right widgets
    --         layout = wibox.layout.fixed.horizontal,
    --         s.mylayoutbox,
    --     },
    -- }
end

-- Generate Awesome icon:
-- theme.awesome_icon = theme_assets.awesome_icon(
--     theme.menu_height, theme.bg_focus, theme.fg_focus
-- )

return theme
