-- General lvim builtin plugin settings {{{

lvim.log.level = "warn"
-- lvim.format_on_save = false
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = "*.lua"
-- lvim.lsp.automatic_servers_installation = true
lvim.lsp.installer.setup.automatic_installation = false

-- Lualine
-- local components = require("lvim.core.lualine.components")
-- lvim.builtin.lualine.sections.lualine_a = { "mode" }
-- lvim.builtin.lualine.inactive_sections.lualine_x = { components.scrollbar }
-- lvim.builtin.lualine.options.component_separators =  { left = "", right = "" }
-- lvim.builtin.lualine.options.section_separators = { left = "" }
-- lvim.builtin.lualine.sections.lualine_y = {
--   components.spaces,
--   components.location
-- }
-- lvim.builtin.lualine.sections.lualine_z = {
--   components.scrollbar,
--   components.location
-- }

lvim.builtin.lualine.style = "lvim"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- bufferline remove buffer title for NvimTree
-- lvim.builtin.bufferline.options.offsets[2] = nil
-- lvim.builtin.bufferline.options.offsets[2].text = ""
-- lvim.builtin.bufferline.options.offsets[2].highlight = "BufferTabpageFill"
lvim.builtin.bufferline.options.offsets[2].highlight = "Directory"

-- lvim.builtin.telescope.theme = "default"

-- Enable cmp cmdline.
-- lvim.builtin.cmp.cmdline.enable = true

-- Configure alpha dashboard {{{
-- lvim.builtin.alpha.dashboard.section.header.val = {
--   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--   " ▄▄▄█████▓ ███▄    █ ▄▄▄█████▓ ",
--   " ▓  ██▒ ▓▒ ██ ▀█   █ ▓  ██▒ ▓▒ ",
--   " ▒ ▓██░ ▒░▓██  ▀█ ██▒▒ ▓██░ ▒░ ",
--   " ░ ▓██▓ ░ ▓██▒  ▐▌██▒░ ▓██▓ ░  ",
--   "   ▒██▒ ░ ▒██░   ▓██░  ▒██▒ ░  ",
--   "   ▒ ░░   ░ ▒░   ▒ ▒   ▒ ░░    ",
--   "     ░    ░ ░░   ░ ▒░    ░     ",
--   "   ░         ░   ░ ░   ░       ",
--   "                   ░           ",
-- }

--- }}}

-- }}}

-- Colorscheme {{{

lvim.transparent_window = true

-- lunar {{{

-- lvim.colorscheme = "lunar"
-- local bg_color = "#1a1b26"
-- vim.cmd [[au ColorScheme * hi VertSplit ctermbg=none guibg=bg_color]]
-- vim.cmd [[au ColorScheme * hi FloatBorder ctermbg=none guibg=bg_color]]
-- vim.cmd [[au ColorScheme * hi NormalFloat ctermbg=none guibg=bg_color]]

-- }}}

-- gruvbox-material {{{

lvim.colorscheme = "gruvbox-material"

local bg_color = "#1d2021"
vim.g.gruvbox_material_background = "hard" -- hard, medium, soft
vim.g.gruvbox_material_foreground = "mix" -- material, mix, original
vim.g.gruvbox_material_visual = "blue background"
vim.g.gruvbox_material_menu_selection_background = "blue"
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
-- vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_statusline_style = "default"
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_text_highlight = 1
-- vim.cmd([[highlight lualine_x_diagnostics_hint_normal guifg=#32302f guibg=#32302f]])
-- vim.g.gruvbox_material_diagnostic_text_highlight = 1
-- vim.api.nvim_set_hl(0, "WhichKeyFloat", { fg = "#1d2021", bg = "#1d2021" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1d2021" })
-- lvim.builtin.nvimtree.highlights.NvimTreeEndOfBuffer.guibg = "#1d2021"
-- lvim.builtin.which_key.setup.window.border = "single" -- none, single, double, shadow
-- change in /home/user/.local/lunarvim/site/pack/packer/start/gruvbox-material/gruvbox-material.vim
-- call gruvbox_material#highlight('NormalFloat', s:palette.fg1, s:palette.bg0)
-- call gruvbox_material#highlight('FloatBorder', s:palette.grey1, s:palette.bg0)
-- bufferline color adjustment
-- lvim.builtin.bufferline.highlights = {
--   background = {
--     -- gui = "italic",
--     italic = true,
--   },
--   buffer_selected = {
--     -- gui = "bold",
--     bold = true,
--   },
--   fill = {
--     bg = "#282828",
--     -- bg = "#1d2021",
--   },
-- }
-- lvim.builtin.bufferline.highlights.fill.guibg = "#2F343F"
-- lualine inactive color for gruvbox_material colorscheme
-- lvim.builtin.bufferline.highlights.fill.guibg = "#32302f"
-- lvim.builtin.bufferline.highlights.fill.guibg = "#40423D"
-- lvim.builtin.bufferline.highlights.fill.guibg = "#282828"
-- Override these highlight groups
vim.cmd [[au ColorScheme * hi NvimTreeEndOfBuffer ctermbg=none guibg=bg_color]]
vim.cmd [[au ColorScheme * hi FloatBorder ctermbg=none guibg=bg_color]]
vim.cmd [[au ColorScheme * hi NormalFloat ctermbg=none guibg=bg_color]]
vim.cmd [[au ColorScheme * hi Folded ctermbg=none guibg=bg_color]]

-- }}}

-- gruvbox {{{

-- lvim.colorscheme = "gruvbox"

-- }}}

-- everforest {{{

-- vim.g.everforest_background = "hard"
-- vim.g.everforest_diagnostic_virtual_text = "colored"
-- lvim.colorscheme = "everforest"

-- }}}

-- gruvbox-baby {{{

-- lvim.colorscheme = "gruvbox-baby"

-- }}}

-- tokyonight {{{

-- lvim.colorscheme = "tokyonight-night"

-- }}}

-- catppuccin {{{

-- local catppuccin = require("catppuccin")
-- catppuccin.setup({
--     flavour = "mocha", -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--         light = "latte",
--         dark = "mocha",
--     },
--     transparent_background = false,
--     show_end_of_buffer = false, -- show the '~' characters after the end of buffers
--     term_colors = false,
--     dim_inactive = {
--         enabled = false,
--         shade = "dark",
--         percentage = 0.15,
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false, -- Force no bold
--     styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     color_overrides = {},
--     custom_highlights = {},
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         notify = false,
--         mini = false,
--         special = true,
--         -- treesitter = true,
--         -- whick_key = true,
--         -- illuminate = true,
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
-- })
-- lvim.colorscheme = "catppuccin"

-- }}}

-- tokyodark {{{

-- lvim.colorscheme = "tokyodark"

-- }}}

-- moonlight {{{

-- lvim.colorscheme = "moonlight"

-- }}}

-- kanagawa {{{

-- lvim.colorscheme = "kanagawa"

-- }}}

-- rose-pine {{{

-- require('rose-pine').setup({
-- 	--- @usage 'auto'|'main'|'moon'|'dawn'
-- 	variant = 'auto',
-- 	--- @usage 'main'|'moon'|'dawn'
-- 	dark_variant = 'main',
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = true,
-- 	disable_float_background = true,
-- 	disable_italics = false,

-- 	--- @usage string hex value or named color from rosepinetheme.com/palette
-- 	groups = {
-- 		background = 'base',
-- 		background_nc = '_experimental_nc',
-- 		panel = 'surface',
-- 		panel_nc = 'base',
-- 		border = 'highlight_med',
-- 		comment = 'muted',
-- 		link = 'iris',
-- 		punctuation = 'subtle',

-- 		error = 'love',
-- 		hint = 'iris',
-- 		info = 'foam',
-- 		warn = 'gold',

-- 		headings = {
-- 			h1 = 'iris',
-- 			h2 = 'foam',
-- 			h3 = 'rose',
-- 			h4 = 'gold',
-- 			h5 = 'pine',
-- 			h6 = 'foam',
-- 		}
-- 		-- or set all headings at once
-- 		-- headings = 'subtle'
-- 	},

-- 	-- Change specific vim highlight groups
-- 	-- https://github.com/rose-pine/neovim/wiki/Recipes
--   -- Change specific vim highlight groups
-- 	highlight_groups = {
--     ColorColumn = { bg = 'rose' },
--     WhichKeyFloat = { bg = 'base' },
--     NormalFloat = { bg = 'base' },
--     FloatBorder = { bg = 'base' },
--     -- GitSignsAdd = { fg = 'foam' },
--     -- GitSignsChange = { fg = 'gold' },
--     -- GitSignsChange = { fg = 'pine' },
--     GitSignsDelete = { fg = 'love' },
--     -- lualine_c_diff_added_normal = { fg = 'foam' },
--     -- lualine_b_inactive = { guibg = 'surface' },
--     -- lualine_c_inactive = { guibg = 'surface' },

-- 		-- Blend colours against the "base" background
-- 		-- CursorLine = { bg = 'foam', blend = 10 },
-- 		-- StatusLine = { fg = 'love', bg = 'love', blend = 10 },
-- 	}
-- })

-- -- Set colorscheme after options
-- -- vim.cmd('colorscheme rose-pine')
-- lvim.colorscheme = "rose-pine"

-- lvim.builtin.lualine.sections.lualine_c.diff.diff_color.added = "#9ccfd8"
-- lvim.builtin.lualine.sections.lualine_c.diff.diff_color.modified = "#f6c177"
-- lvim.builtin.lualine.sections.lualine_c.diff.diff_color.deleted = "#eb6f92"

-- set bufferline fill color
-- lvim.builtin.bufferline.highlights = { background = {
--   -- gui = "italic",
--   italic = true,
-- },
--   buffer_selected = {
--     -- gui = "bold",
--     bold = true,
--   },
--   fill = {
--     bg = "#2a273f"
--   },
-- }
-- lvim.builtin.bufferline.highlights.fill.guibg = "#2a273f" -- this is for moon

-- local bg_color = "#232136"
-- vim.cmd [[au ColorScheme * hi WhichKeyFloat ctermbg=none guibg=bg_color]]
-- vim.cmd [[au ColorScheme * hi FloatBorder ctermbg=none guibg=bg_color]]

-- }}}

-- }}}

-- Options {{{

vim.opt.background = "dark"
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern, use space h to unhighlight everything
vim.opt.incsearch = true
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.autoindent = true
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
-- vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.titlestring = "%<%F | %l/%L - nvim" -- what the title of the window will be set to
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 250 -- faster completion
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.softtabstop = 2 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.fillchars = vim.opt.fillchars + "diff:╱"
-- vim.cmd("set winbar=%=%m\ %f") -- set winbar (TODO: broken syntax)
-- vim.opt.foldlevel = 0
vim.opt.foldmethod = "marker"
vim.opt.list = true
vim.opt.listchars = { eol = "↲", tab = "▸ ", trail = "·" }
vim.opt.showbreak = "↪"

-- }}}
