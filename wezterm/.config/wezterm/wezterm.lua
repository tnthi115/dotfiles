-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'GruvboxDarkHard'
-- config.color_scheme = 'Gruvbox dark, hard (base16)'
-- config.color_scheme = "Gruvbox Material"
config.color_scheme = "Tokyo Night"

config.color_scheme_dirs = { "$HOME/dotfiles/wezterm/colors" }

config.color_schemes = {
	["Gruvbox Material"] = {
		-- The default text color
		foreground = "#e2cca9",
		-- The default background color
		background = "#1d2021",

		-- Overrides the cell background color when the current cell is occupied by the
		-- cursor and the cursor style is set to Block
		cursor_bg = "#cccccc",
		-- Overrides the text color when the current cell is occupied by the cursor
		cursor_fg = "#1d2021",
		-- Specifies the border color of the cursor when the cursor style is set to Block,
		-- or the color of the vertical or horizontal bar when the cursor style is set to
		-- Bar or Underline.
		cursor_border = "#d4be98",

		-- the foreground color of selected text
		selection_fg = "#3c3836",
		-- the background color of selected text
		selection_bg = "#fffacd",

		-- The color of the scrollbar "thumb"; the portion that represents the current viewport
		scrollbar_thumb = "#222222",

		-- The color of the split lines between panes
		split = "#444444",

		ansi = {
			"#665c54",
			"#f2594b",
			"#b0b846",
			"#e3a84e",
			"#80aa9e",
			"#d3869b",
			"#8bba7f",
			"#d4be98",
		},
		brights = {
			"#928374",
			"#ea6962",
			"#a9b665",
			"#e9b143",
			"#7daea3",
			"#d3869b",
			"#89b482",
			"#dfbf8e",
		},

		-- Arbitrary colors of the palette in the range from 16 to 255
		-- indexed = { [136] = "#af8700" },

		-- -- Since: 20220319-142410-0fcdea07
		-- -- When the IME, a dead key or a leader key are being processed and are effectively
		-- -- holding input pending the result of input composition, change the cursor
		-- -- to this color to give a visual cue about the compose state.
		-- compose_cursor = 'orange',

		-- -- Colors for copy_mode and quick_select
		-- -- available since: 20220807-113146-c2fee766
		-- -- In copy_mode, the color of the active text is:
		-- -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
		-- -- 2. selection_* otherwise
		-- copy_mode_active_highlight_bg = { Color = '#000000' },
		-- -- use `AnsiColor` to specify one of the ansi color palette values
		-- -- (index 0-15) using one of the names "Black", "Maroon", "Green",
		-- --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
		-- -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
		-- copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
		-- copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
		-- copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

		-- quick_select_label_bg = { Color = 'peru' },
		-- quick_select_label_fg = { Color = '#ffffff' },
		-- quick_select_match_bg = { AnsiColor = 'Navy' },
		-- quick_select_match_fg = { Color = '#ffffff' },
	},
	-- ["Tokyo Night"] = {
	-- 	-- The default text color
	-- 	foreground = "#c0caf5",
	-- 	-- The default background color
	-- 	background = "#1a1b26",

	-- 	-- Overrides the cell background color when the current cell is occupied by the
	-- 	-- cursor and the cursor style is set to Block
	-- 	cursor_bg = "#c0caf5",
	-- 	-- Overrides the text color when the current cell is occupied by the cursor
	-- 	cursor_fg = "1a1b26",
	-- 	-- Specifies the border color of the cursor when the cursor style is set to Block,
	-- 	-- or the color of the vertical or horizontal bar when the cursor style is set to
	-- 	-- Bar or Underline.
	-- 	cursor_border = "#c0caf5",

	-- 	-- the foreground color of selected text
	-- 	selection_fg = "#c0caf5",
	-- 	-- the background color of selected text
	-- 	selection_bg = "#283457",

	-- 	-- The color of the scrollbar "thumb"; the portion that represents the current viewport
	-- 	scrollbar_thumb = "#222222",

	-- 	-- The color of the split lines between panes
	-- 	split = "#7aa2f7",

	-- 	ansi = {
	-- 		"#15161e",
	-- 		"#f7768e",
	-- 		"#9ece6a",
	-- 		"#e0af68",
	-- 		"#7aa2f7",
	-- 		"#bb9af7",
	-- 		"#7dcfff",
	-- 		"#a9b1d6",
	-- 	},
	-- 	brights = {
	-- 		"#414868",
	-- 		"#f7768e",
	-- 		"#9ece6a",
	-- 		"#e0af68",
	-- 		"#7aa2f7",
	-- 		"#bb9af7",
	-- 		"#7dcfff",
	-- 		"#c0caf5",
	-- 	},
	-- },
}

config.font = wezterm.font_with_fallback({
	"CaskaydiaCove Nerd Font",
	"Hack Nerd Font",
	"Symbols Nerd Font",
})
config.font_size = 13.0

-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- config.window_decorations = "TITLE | RESIZE"
config.window_decorations = "RESIZE"

config.window_padding = {
	left = 1,
	right = 0,
	top = 2,
	bottom = 0,
}

config.window_background_opacity = 0.90

config.window_close_confirmation = "NeverPrompt"

config.keys = {
	{
		key = "m",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- and finally, return the configuration to wezterm
return config
