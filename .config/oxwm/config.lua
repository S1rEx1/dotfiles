---@meta
---@module 'oxwm'

local modkey = "Mod4"
local terminal = "st"


local colors = require("black_gruvbox");

local tags = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
-- local tags = { "", "󰊯", "", "", "󰙯", "󱇤", "", "󱘶", "󰧮" }
-- local tags = { "", "", "", "", "󰏫", "", "", "", "" }

local bar_font = "Iosevka:style=Regular:size=12"

local blocks = {
    oxwm.bar.block.shell({
        format = "{}",
        command = "xkblayout",
        interval = 1,
        color = colors.red,
        underline = false,
    }),
    oxwm.bar.block.static({
        text = "│",
        interval = 999999999,
        color = colors.lavender,
        underline = false,
    }),
    oxwm.bar.block.ram({
        format = "Ram: {used}/{total} GB",
        interval = 5,
        color = colors.light_blue,
        underline = false,
    }),
    oxwm.bar.block.static({
        text = "│",
        interval = 999999999,
        color = colors.lavender,
        underline = false,
    }),
    oxwm.bar.block.datetime({
        format = "{}",
        date_format = "%a, %b %d - %-I:%M %P",
        interval = 1,
        color = colors.cyan,
        underline = false,
    }),
    oxwm.bar.block.static({
        text = "│",
        interval = 999999999,
        color = colors.lavender,
        underline = false,
    }),
    oxwm.bar.block.battery({
        format = "Bat: {}%",
        charging = "⚡ Bat: {}%",
        discharging = "Bat: {}%",
        full = "Bat: {}%",
        interval = 30,
        color = colors.green,
        underline = false,
        click = {command = "st -e bluetui", floating = true},
    }),
};

oxwm.set_terminal(terminal)
oxwm.set_modkey(modkey) -- This is for Mod + mouse binds, such as drag/resize
oxwm.set_tags(tags)

oxwm.set_layout_symbol("tiling", "[T]")
oxwm.set_layout_symbol("normie", "[F]")
oxwm.set_layout_symbol("tabbed", "[=]")
oxwm.set_layout_symbol("dwindle", "[\\]")

oxwm.border.set_width(2)
oxwm.border.set_focused_color(colors.red)
oxwm.border.set_unfocused_color(colors.fg)

oxwm.set_floating_position("center")

oxwm.gaps.set_smart(false)
oxwm.gaps.set_inner(5, 5)
oxwm.gaps.set_outer(5, 5)

oxwm.rule.add({ instance = "gimp", floating = true })
oxwm.rule.add({ class = "Alacritty", tag = 1, focus = true })
oxwm.rule.add({ class = "firefox", tag = 2 })


oxwm.bar.set_font(bar_font)

-- oxwm.bar.set_position("bottom")

oxwm.bar.set_blocks(blocks)

oxwm.bar.set_scheme_normal(colors.fg, colors.bg, "#444444")
oxwm.bar.set_scheme_occupied(colors.red, colors.bg, colors.red)
oxwm.bar.set_scheme_selected(colors.red, colors.bg, colors.red)
oxwm.bar.set_scheme_urgent(colors.red, colors.bg, colors.red)



oxwm.key.bind({ modkey }, "Return", oxwm.spawn_terminal())
oxwm.key.bind({ modkey }, "D", oxwm.spawn({ "sh", "-c", "rofi -show drun" }))
oxwm.key.bind({ modkey }, "W", oxwm.spawn({ "sh", "-c", "firefox" }))
oxwm.key.bind({ modkey }, "Delete", oxwm.spawn({ "sh", "-c", "~/.config/rofi/power-menu.sh" }))
oxwm.key.bind({ modkey }, "P", oxwm.spawn({ "sh", "-c", "~/.config/rofi/repos.sh" }))
oxwm.key.bind({ modkey }, "S", oxwm.spawn({ "sh", "-c", "maim -s | xclip -selection clipboard -t image/png" }))
-- oxwm.key.bind({ modkey, "Shift" }, "S", oxwm.spawn({ "sh", "-c", "maim | xclip -selection clipboard -t image/png" }))
oxwm.key.bind({ modkey }, "Q", oxwm.client.kill())

oxwm.key.bind({ modkey, "Shift" }, "Slash", oxwm.show_keybinds())

-- Window state toggles
oxwm.key.bind({ modkey, "Shift" }, "F", oxwm.client.toggle_fullscreen())
oxwm.key.bind({ modkey, "Shift" }, "Space", oxwm.client.toggle_floating())

oxwm.key.bind({ }, "Print", oxwm.spawn({ "sh", "-c", "maim | xclip -selection clipboard -t image/png"}))


oxwm.key.bind({ modkey }, "C", oxwm.layout.set("tiling"))
oxwm.key.bind({ modkey }, "N", oxwm.layout.cycle())

oxwm.key.bind({ modkey }, "H", oxwm.set_master_factor(-5))
oxwm.key.bind({ modkey }, "L", oxwm.set_master_factor(5))
-- oxwm.tiled_resize_mode(true)
oxwm.key.bind({ modkey }, "I", oxwm.inc_num_master(1))
oxwm.key.bind({ modkey }, "O", oxwm.inc_num_master(-1))

oxwm.key.bind({ modkey }, "A", oxwm.toggle_gaps())
oxwm.key.bind({ modkey }, "B", oxwm.toggle_bar())

oxwm.key.bind({ modkey, "Shift" }, "Q", oxwm.quit())
oxwm.key.bind({ modkey, "Shift" }, "R", oxwm.restart())

oxwm.key.bind({ modkey }, "J", oxwm.client.focus_stack(1))
oxwm.key.bind({ modkey }, "K", oxwm.client.focus_stack(-1))

oxwm.key.bind({ modkey, "Shift" }, "J", oxwm.client.move_stack(1))
oxwm.key.bind({ modkey, "Shift" }, "K", oxwm.client.move_stack(-1))


oxwm.key.bind({ modkey }, "1", oxwm.tag.view(0))
oxwm.key.bind({ modkey }, "2", oxwm.tag.view(1))
oxwm.key.bind({ modkey }, "3", oxwm.tag.view(2))
oxwm.key.bind({ modkey }, "4", oxwm.tag.view(3))
oxwm.key.bind({ modkey }, "5", oxwm.tag.view(4))
oxwm.key.bind({ modkey }, "6", oxwm.tag.view(5))
oxwm.key.bind({ modkey }, "7", oxwm.tag.view(6))
oxwm.key.bind({ modkey }, "8", oxwm.tag.view(7))
oxwm.key.bind({ modkey }, "9", oxwm.tag.view(8))

oxwm.key.bind({ modkey, "Shift" }, "1", oxwm.tag.move_to(0))
oxwm.key.bind({ modkey, "Shift" }, "2", oxwm.tag.move_to(1))
oxwm.key.bind({ modkey, "Shift" }, "3", oxwm.tag.move_to(2))
oxwm.key.bind({ modkey, "Shift" }, "4", oxwm.tag.move_to(3))
oxwm.key.bind({ modkey, "Shift" }, "5", oxwm.tag.move_to(4))
oxwm.key.bind({ modkey, "Shift" }, "6", oxwm.tag.move_to(5))
oxwm.key.bind({ modkey, "Shift" }, "7", oxwm.tag.move_to(6))
oxwm.key.bind({ modkey, "Shift" }, "8", oxwm.tag.move_to(7))
oxwm.key.bind({ modkey, "Shift" }, "9", oxwm.tag.move_to(8))

oxwm.key.bind({ modkey, "Control" }, "1", oxwm.tag.toggleview(0))
oxwm.key.bind({ modkey, "Control" }, "2", oxwm.tag.toggleview(1))
oxwm.key.bind({ modkey, "Control" }, "3", oxwm.tag.toggleview(2))
oxwm.key.bind({ modkey, "Control" }, "4", oxwm.tag.toggleview(3))
oxwm.key.bind({ modkey, "Control" }, "5", oxwm.tag.toggleview(4))
oxwm.key.bind({ modkey, "Control" }, "6", oxwm.tag.toggleview(5))
oxwm.key.bind({ modkey, "Control" }, "7", oxwm.tag.toggleview(6))
oxwm.key.bind({ modkey, "Control" }, "8", oxwm.tag.toggleview(7))
oxwm.key.bind({ modkey, "Control" }, "9", oxwm.tag.toggleview(8))

oxwm.key.bind({ modkey, "Control", "Shift" }, "1", oxwm.tag.toggletag(0))
oxwm.key.bind({ modkey, "Control", "Shift" }, "2", oxwm.tag.toggletag(1))
oxwm.key.bind({ modkey, "Control", "Shift" }, "3", oxwm.tag.toggletag(2))
oxwm.key.bind({ modkey, "Control", "Shift" }, "4", oxwm.tag.toggletag(3))
oxwm.key.bind({ modkey, "Control", "Shift" }, "5", oxwm.tag.toggletag(4))
oxwm.key.bind({ modkey, "Control", "Shift" }, "6", oxwm.tag.toggletag(5))
oxwm.key.bind({ modkey, "Control", "Shift" }, "7", oxwm.tag.toggletag(6))
oxwm.key.bind({ modkey, "Control", "Shift" }, "8", oxwm.tag.toggletag(7))
oxwm.key.bind({ modkey, "Control", "Shift" }, "9", oxwm.tag.toggletag(8))

oxwm.key.chord({
    { { modkey }, "Space" },
    { {},         "T" }
}, oxwm.spawn_terminal())

oxwm.autostart("xset r rate 200 35 &")
oxwm.autostart("feh --bg-scale ~/Pictures/wallpapers/black.png")
oxwm.autostart("dunst")
