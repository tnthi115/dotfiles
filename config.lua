--
-- ▄▄▄█████▓ ███▄    █ ▄▄▄█████▓
-- ▓  ██▒ ▓▒ ██ ▀█   █ ▓  ██▒ ▓▒
-- ▒ ▓██░ ▒░▓██  ▀█ ██▒▒ ▓██░ ▒░
-- ░ ▓██▓ ░ ▓██▒  ▐▌██▒░ ▓██▓ ░
--   ▒██▒ ░ ▒██░   ▓██░  ▒██▒ ░
--   ▒ ░░   ░ ▒░   ▒ ▒   ▒ ░░
--     ░    ░ ░░   ░ ▒░    ░
--   ░         ░   ░ ░   ░
--                   ░

--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
-- lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "tokyonight"
-- lvim.colorscheme = "vscode"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- COLORSCHEME --
-- gruvbox-material
vim.g.gruvbox_material_background = "medium" -- hard, medium, soft
vim.g.gruvbox_material_foreground = "material" -- material, mix, original
vim.g.gruvbox_material_visual = "blue background"
vim.g.gruvbox_material_menu_selection_background = "blue"
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_statusline_style = "default"
vim.g.gruvbox_material_diagnostic_line_highlight = 1
-- vim.api.nvim_set_hl(0, "WhichKeyFloat", {fg = "#32302f", bg = "#32302f"})
-- vim.api.nvim_set_hl(0, "FloatBorder", {bg = "#32302f"})
-- lvim.builtin.which_key.setup.window.border = "single" -- none, single, double, shadow
-- change in gruvbox-material.vim
-- call gruvbox_material#highlight('NormalFloat', s:palette.fg1, s:palette.bg1)
-- call gruvbox_material#highlight('FloatBorder', s:palette.grey1, s:palette.bg0)
-- bufferline color adjustment
lvim.builtin.bufferline.highlights = { background = {
                                         gui = "italic",
                                       },
                                       buffer_selected = {
                                         gui = "bold",
                                       },
                                       fill = {
                                       },
                                     }
-- lvim.builtin.bufferline.highlights.fill.guibg = "#2F343F"
-- lualine inactive color for gruvbox_material colorscheme
lvim.builtin.bufferline.highlights.fill.guibg = "#32302f"
-- lvim.builtin.bufferline.highlights.fill.guibg = "#40423D"
lvim.colorscheme = "gruvbox-material"

-- everforest
-- vim.g.everforest_background = "hard"
-- vim.g.everforest_diagnostic_virtual_text = "colored"
-- lvim.colorscheme = "everforest"

-- gruvbox-baby
-- lvim.colorscheme = "gruvbox-baby"

-- catppuccin
-- vim.g.catppuccin_flavour =  "macchiato" -- latte, frappe, macchiato, mocha
-- lvim.colorscheme = "catppuccin"
-- local catppuccin = require("catppuccin")
-- catppuccin.setup()

-- tokyodark
-- lvim.colorscheme = "tokyodark"

-- moonlight
-- lvim.colorscheme = "moonlight"

-- kanagawa
-- lvim.colorscheme = "kanagawa"

-- rose-pine
-- require('rose-pine').setup({
-- 	--- @usage 'main' | 'moon'
-- 	dark_variant = 'moon',
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = false,
-- 	disable_float_background = false,
-- 	disable_italics = true,

-- 	--- @usage string hex value or named color from rosepinetheme.com/palette
-- 	groups = {
-- 		background = 'base',
-- 		panel = 'surface',
-- 		-- panel = 'gold',
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
-- 	highlight_groups = {
-- 		ColorColumn = { bg = 'rose' }
-- 	}
-- })
-- lvim.colorscheme = "rose-pine"

-- VIM SETS --
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
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
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

-- KEYMAPPINGS [view all the defaults by pressing <leader>Lk] --
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- lvim.keys.normal_mode["<C-h>"] = "<C-W>h"
-- lvim.keys.normal_mode["<C-l>"] = "<C-W>l"

-- <K> ("shift+k") to hover

-- flip window resizing keys
lvim.keys.normal_mode["<C-Up>"] = ":resize -2<CR>"
lvim.keys.normal_mode["<C-Down>"] = ":resize +2<CR>"
lvim.keys.normal_mode["<C-Left>"] = ":vertical resize +2<CR>"
lvim.keys.normal_mode["<C-Right>"] = ":vertical resize -2<CR>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- WHICH-KEY --
-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- Add TroubleToggle
lvim.builtin.which_key.mappings["E"] = {
  -- name = "+Trouble",
  name = "+Errors",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}
-- Add diffview open to git submenu
lvim.builtin.which_key.mappings["gv"] = {
  "<cmd>DiffviewOpen<CR>", "Open Diffview"
}
-- Diffview close
lvim.builtin.which_key.mappings["gq"] = {
  "<cmd>DiffviewClose<CR>", "Close Diffview"
}
-- Markdown Preview
lvim.builtin.which_key.mappings["m"] = {
  "<cmd>MarkdownPreviewToggle<CR>", "Markdown Preview"
}
-- Terminal
lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  t = { "<cmd>ToggleTerm<CR>", "Toggle" },
  f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
  v = { "<cmd>ToggleTerm direction=vertical size=50<CR>", "Vertical" },
  h = { "<cmd>ToggleTerm direction=horizontal<CR>", "Horizontal" },
  T = { "<cmd>ToggleTerm direction=tab<CR>", "Tab" },
}
-- Bufferline
lvim.builtin.which_key.mappings[","] = {
  "<cmd>BufferLineMovePrev<CR>", "Move Buffer Left"
}
lvim.builtin.which_key.mappings["."] = {
  "<cmd>BufferLineMoveNext<CR>", "Move Buffer Right"
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- bufferline remove buffer title for NvimTree
lvim.builtin.bufferline.options.offsets[2] = nil

-- generic LSP settings --

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   -- {
--   --   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--   --   command = "prettier",
--   --   ---@usage arguments to pass to the formatter
--   --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--   --   extra_args = { "--print-with", "100" },
--   --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--   --   filetypes = { "typescript", "typescriptreact" },
--   -- },
-- }

-- set additional linters --
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "flake8", filetypes = { "python" } },
  { command = "pylint", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  -- {
  --   command = "codespell",
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "javascript", "python", "shell" },
  -- },
}

-- ADDITIONAL PLUGINS --
lvim.plugins = {
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "morhetz/gruvbox" },
  -- { "folke/tokyonight.nvim" },
  -- {"lunarvim/colorschemes"},
  { "sainnhe/gruvbox-material" },
  -- { "sainnhe/edge" },
  -- { "Mofiqul/vscode.nvim" },
  -- { "luisiacc/gruvbox-baby" },
  { "sainnhe/everforest" },
  -- { "tiagovla/tokyodark.nvim" },
  -- { "shaunsingh/moonlight.nvim" },
  -- { "rebelot/kanagawa.nvim" },
  -- { "frenzyexists/aquarium-vim" },
  -- { "catppuccin/nvim", as = "catppuccin" },
  {
    "rose-pine/neovim"
    -- as = 'rose-pine',
    -- tag = 'v1.*',
    -- config = function()
    --     vim.cmd('colorscheme rose-pine')
    -- end
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "sindrets/diffview.nvim" },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  },
}

-- Configure markdown-preview
vim.g.mkdp_browser = "/snap/bin/firefox"
vim.g.mkdp_theme = "dark"

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--   pattern = "zsh",

-- set indentation to 4 spaces for certain files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "json", "java", "xml", "tcl" },
  command = "setlocal shiftwidth=4 softtabstop=4 expandtab",
})
