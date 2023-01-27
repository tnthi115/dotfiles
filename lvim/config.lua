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

-- General lvim builtin plugin settings {{{

lvim.log.level = "warn"
lvim.format_on_save = false
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
-- lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "vscode"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  -- "javascript",
  "json",
  "lua",
  "python",
  -- "typescript",
  -- "tsx",
  -- "css",
  -- "rust",
  "java",
  -- "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- bufferline remove buffer title for NvimTree
-- lvim.builtin.bufferline.options.offsets[2] = nil
-- lvim.builtin.bufferline.options.offsets[2].text = ""
-- lvim.builtin.bufferline.options.offsets[2].highlight = "BufferTabpageFill"
lvim.builtin.bufferline.options.offsets[2].highlight = "Directory"

-- }}}

-- Colorscheme {{{

lvim.transparent_window = true

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

-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- lvim.colorscheme = "catppuccin"
-- local catppuccin = require("catppuccin")
-- catppuccin.setup()

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

-- lvim.colorscheme = "rose-pine"

-- require('rose-pine').setup({
--   --- @usage 'main' | 'moon'
--   dark_variant = 'main',
--   bold_vert_split = false,
--   dim_nc_background = false,
--   disable_background = false,
--   disable_float_background = false,
--   disable_italics = true,

--   --- @usage string hex value or named color from rosepinetheme.com/palette
--   groups = {
--     background = 'base',
--     panel = 'surface',
--     -- panel = 'gold',
--     border = 'highlight_med',
--     comment = 'muted',
--     link = 'iris',
--     punctuation = 'subtle',

--     error = 'love',
--     hint = 'iris',
--     info = 'foam',
--     warn = 'gold',

--     headings = {
--       h1 = 'iris',
--       h2 = 'foam',
--       h3 = 'rose',
--       h4 = 'gold',
--       h5 = 'pine',
--       h6 = 'foam',
--     }
--     -- or set all headings at once
--     -- headings = 'subtle'
--   },

--   -- Change specific vim highlight groups
--   highlight_groups = {
--     ColorColumn = { bg = 'rose' },
--     -- lualine_b_inactive = { guibg = 'surface' },
--     -- lualine_c_inactive = { guibg = 'surface' },
--   }
-- })
-- -- set bufferline fill color
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
-- -- lvim.builtin.bufferline.highlights.fill.guibg = "#2a273f" -- this is for moon

-- }}}

-- }}}

-- Vim Sets {{{

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
-- vim.cmd("set winbar=%=%m\ %f") -- set winbar (TODO: broken syntax)

-- }}}

-- Keymappings [view all the defaults by pressing <leader>Lk] {{{

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

-- Remap H and L to move between buffers.
lvim.keys.normal_mode["<S-H>"] = "<cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-L>"] = "<cmd>BufferLineCycleNext<CR>"

-- Center cursor when paging up/down and when cycling through search terms.
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"

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

-- }}}

-- Which-key {{{

-- Turn on which-key help for bindings for folds, spelling and others prefixed with z
lvim.builtin.which_key.setup.plugins.presets.z = true

-- lvim.builtin.which_key.icons.separator = "->"
-- lvim.builtin.which_key.icons.group = "+"
-- lvim.builtin.which_key.icons = {
--   breadcrumb = lvim.icons.ui.DoubleChevronRight, -- symbol used in the command line area that shows your active key combo
--   separator = "->",
--   group = "+",
-- }
-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- Add TroubleToggle
lvim.builtin.which_key.mappings["E"] = {
  -- name = "+Trouble",
  name = "Errors",
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
  name = "Terminal",
  t = { "<cmd>ToggleTerm<CR>", "Toggle" },
  f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
  v = { "<cmd>ToggleTerm direction=vertical size=50<CR>", "Vertical" },
  h = { "<cmd>ToggleTerm direction=horizontal<CR>", "Horizontal" },
  T = { "<cmd>ToggleTerm direction=tab<CR>", "Tab" },
}
-- Bufferline
lvim.builtin.which_key.mappings["b,"] = {
  "<cmd>BufferLineMovePrev<CR>", "Move Buffer Left"
}
lvim.builtin.which_key.mappings["b."] = {
  "<cmd>BufferLineMoveNext<CR>", "Move Buffer Right"
}
-- Colorizer
lvim.builtin.which_key.mappings["C"] = {
  "<cmd>ColorizerToggle<CR>", "Toggle Color"
}
-- Show full path of current buffer
lvim.builtin.which_key.mappings["bp"] = {
  "<cmd>echo expand('%:p)')<CR>", "Show Buffer Path"
}
-- Persistence (sessions)
-- lvim.builtin.which_key.mappings["S"] = {
--   name = "Session",
--   c = { "<cmd>lua require('persistence').load()<CR>", "Restore last session for current dir" },
--   l = { "<cmd>lua require('persistence').load({ last = true })<CR>", "Restore last session" },
--   Q = { "<cmd>lua require('persistence').stop()<CR>", "Quit without saving session" },
-- }

-- Distant
-- lvim.builtin.which_key.mappings["D"] = {
--   name = "+Distant",
--   -- dactions = require("distant.nav.actions"),
--   l = { "<cmd>DistantLaunch cedar.cs.berkeley.edu mode=ssh ssh.user=cs164-aak<CR>", "Launch cs164" },
--   o = { "<cmd>DistantOpen .<CR>", "Open root dir" },
--   e = { "<cmd>lua require('distant.nav.actions').edit()<CR>", "Edit file" },
--   u = { "<cmd>lua require('distant.nav.actions').up()<CR>", "Go up dir" },
--   k = { "<cmd>lua require('distant.nav.actions').mkdir()<CR>", "Mkdir" },
--   n = { "<cmd>lua require('distant.nav.actions').newfile()<CR>", "Create new file" },
--   r = { "<cmd>lua require('distant.nav.actions').rename()<CR>", "Rename file" },
--   d = { "<cmd>lua require('distant.nav.actions').remove()<CR>", "Remove file" },
-- }

-- }}}

-- Generic LSP settings {{{

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

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- need to "pip install black"
  -- can install with mason.nvim
  -- { command = "black", filetypes = { "python" } },
  -- { name = "black" },
  -- need to "pip install yapf"
  -- { command = "yapf", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  -- {
  --   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "prettier",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--print-with", "100" },
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "typescript", "typescriptreact" },
  -- },
}

-- set additional linters --
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "flake8", filetypes = { "python" } },
  -- { command = "pylint", filetypes = { "python" } },
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

-- }}}

-- Autocommands (https://neovim.io/doc/user/autocmd.html) {{{

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})

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
  pattern = { "python", "java", "xml", "tcl", "markdown", "css" },
  -- pattern = { "java", "xml", "tcl", "markdown", "css" },
  command = "setlocal shiftwidth=4 softtabstop=4 expandtab",
})

-- }}}

-- Additional plugins {{{

lvim.plugins = {
  -- Colorschemes
  -- { "ChristianChiarulli/nvcode-color-schemes.vim" },
  -- { "gruvbox-community/gruvbox" },
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

  -- Error diagnostics
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  -- Git diffview
  { "sindrets/diffview.nvim" },

  -- Markdown previewer
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

  -- Function signature viewer
  { "ray-x/lsp_signature.nvim" },

  -- View colors from color codes
  { "norcalli/nvim-colorizer.lua" },

  -- Incremental line number search
  { "nacro90/numb.nvim" },

  -- Vim sessions
  -- {
  --   "folke/persistence.nvim",
  --   event = "BufReadPre", -- this will only start session saving when an actual file was opened
  --   module = "persistence",
  --   config = function()
  --     require("persistence").setup {
  --       dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
  --       options = { "buffers", "curdir", "tabpages", "winsize" },
  --     }
  --   end,
  -- },
  --
  -- -- Remote editing
  -- {
  --   "chipsenkbeil/distant.nvim",
  --   config = function()
  --     -- local dactions = require('distant.nav.actions')
  --     require('distant').setup {
  --       -- Applies Chip's personal settings to every machine you connect to
  --       --
  --       -- 1. Ensures that distant servers terminate with no connections
  --       -- 2. Provides navigation bindings for remote directories
  --       -- 3. Provides keybinding to jump into a remote file's parent directory
  --       ['*'] = require('distant.settings').chip_default(),
  --       -- Any settings defined here are applied to all hosts
  --       -- ['*'] = {
  --       --   distant = {
  --       --     args = '--shutdown-after 60',
  --       --   },
  --       --   file = {
  --       --     mappings = {
  --       --       ['-'] = dactions.up,
  --       --     },
  --       --   },
  --       --   dir = {
  --       --     mappings = {
  --       --       ['<Return>'] = dactions.edit,
  --       --       ['-']        = dactions.up,
  --       --       ['K']        = dactions.mkdir,
  --       --       ['N']        = dactions.newfile,
  --       --       ['R']        = dactions.rename,
  --       --       ['D']        = dactions.remove,
  --       --     }
  --       --   },
  --       -- },
  --       ['cedar.cs.berkeley.edu'] = {
  --         distant = {
  --           bin = '/home/cc/cs164/fa22/class/cs164-aak/.distant/distant_lua.so',
  --         },
  --         lsp = {
  --           ['ocamllsp'] = {
  --             cmd = { '/home/ff/cs164/.opam/default/bin/ocamllsp' },
  --             filetypes = { 'ocaml' },
  --             root_dir = '/home/cc/cs164/fa22/class/cs164-aak/hw2-tnthi115',
  --             on_attach = function()
  --               vim.cmd("nnoremap('gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')")
  --               vim.cmd("nnoremap('gd', '<CMD>lua vim.lsp.buf.definition()<CR>')")
  --               vim.cmd("nnoremap('gh', '<CMD>lua vim.lsp.buf.hover()<CR>')")
  --               vim.cmd("nnoremap('gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')")
  --               vim.cmd("nnoremap('gr', '<CMD>lua vim.lsp.buf.references()<CR>')")
  --             end,
  --           },
  --         },
  --       },
  --     }
  --   end
  -- },
}

-- Configure markdown-preview {{{

vim.g.mkdp_browser = "/usr/bin/firefox"
vim.g.mkdp_theme = "light"
vim.g.mkdp_auto_close = 0

-- }}}

-- Configure lsp_signature {{{
local cfg = {
  debug = false, -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  -- default is  ~/.cache/nvim/lsp_signature.log
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
  -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
  -- set to 0 if you DO NOT want any API comments be shown
  -- This setting only take effect in insert mode, it does not affect signature help in normal
  -- mode, 10 by default

  max_height = 12, -- max height of signature floating_window
  max_width = 80, -- max_width of signature floating_window
  wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap

  floating_window_off_x = 1, -- adjust float windows x position.
  floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines

  close_timeout = 4000, -- close floating window after ms when laster parameter is entered
  fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
  hint_scheme = "String",
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  handler_opts = {
    border = "rounded" -- double, rounded, single, shadow, none
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

  select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
  move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
}

-- recommended:
require 'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

-- You can also do this inside lsp on_attach
-- note: on_attach deprecated
-- require'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key
require 'lsp_signature'.on_attach(cfg) -- no need to specify bufnr if you don't use toggle_key

-- }}}

-- Configure numb {{{

require('numb').setup {
  show_numbers = true, -- Enable 'number' for the window while peeking
  show_cursorline = true, -- Enable 'cursorline' for the window while peeking
  number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
  centered_peeking = true, -- Peeked line will be centered relative to window
}

--- }}}

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

-- C++ LSP and DAP setup {{{

-- TODO: maybe move this under Generic LSP settings
-- lvim.format_on_save = false
-- lvim.lsp.diagnostics.virtual_text = true

-- lvim.builtin.treesitter.highlight.enable = true

-- -- auto install treesitter parsers
-- lvim.builtin.treesitter.ensure_installed = { "cpp", "c" }

-- Additional Plugins
table.insert(lvim.plugins, {
  "p00f/clangd_extensions.nvim",
  -- cmake integration
  "cdelledonne/vim-cmake",
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

-- some settings can only passed as commandline flags, see `clangd --help`
local clangd_flags = {
  "--background-index",
  "--fallback-style=Google",
  "--all-scopes-completion",
  "--clang-tidy",
  "--log=error",
  "--suggest-missing-includes",
  "--cross-file-rename",
  "--completion-style=detailed",
  "--pch-storage=memory", -- could also be disk
  "--folding-ranges",
  "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
  "--offset-encoding=utf-16", --temporary fix for null-ls
  -- "--limit-references=1000",
  -- "--limit-resutls=1000",
  -- "--malloc-trim",
  -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
  -- "--header-insertion=never",
  -- "--query-driver=<list-of-white-listed-complers>"
}

local provider = "clangd"

local custom_on_attach = function(client, bufnr)
  require("lvim.lsp").common_on_attach(client, bufnr)

  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<leader>lh", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
  vim.keymap.set("x", "<leader>lA", "<cmd>ClangdAST<cr>", opts)
  vim.keymap.set("n", "<leader>lH", "<cmd>ClangdTypeHierarchy<cr>", opts)
  vim.keymap.set("n", "<leader>lt", "<cmd>ClangdSymbolInfo<cr>", opts)
  vim.keymap.set("n", "<leader>lm", "<cmd>ClangdMemoryUsage<cr>", opts)

  require("clangd_extensions.inlay_hints").setup_autocmd()
  require("clangd_extensions.inlay_hints").set_inlay_hints()
end

local status_ok, project_config = pcall(require, "rhel.clangd_wrl")
if status_ok then
  clangd_flags = vim.tbl_deep_extend("keep", project_config, clangd_flags)
end

local custom_on_init = function(client, bufnr)
  require("lvim.lsp").common_on_init(client, bufnr)
  require("clangd_extensions.config").setup {}
  require("clangd_extensions.ast").init()
  vim.cmd [[
  command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
  command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
  command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
  command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
  command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
  ]]
end

local opts = {
  cmd = { provider, unpack(clangd_flags) },
  on_attach = custom_on_attach,
  on_init = custom_on_init,
}

require("lvim.lsp.manager").setup("clangd", opts)

-- install codelldb with :MasonInstall codelldb
-- configure nvim-dap (codelldb)
lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      command = "codelldb",
      args = { "--port", "${port}" },

      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        local path
        -- vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
        vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/Debug/" }, function(input)
          path = input
        end)
        vim.cmd [[redraw]]
        return path
      end,
      -- for cs184, executable should be run with cwd = build/
      -- cwd = "${workspaceFolder}",
      cwd = "${workspaceFolder}/Debug",
      stopOnEntry = false,
    },
  }

  dap.configurations.c = dap.configurations.cpp
end

-- vim-cmake configuration
vim.cmd [[let g:cmake_link_compile_commands = 1]]
vim.cmd [[let g:cmake_default_config = "build"]]
-- vim.cmd [[let g:cmake_build_dir_location = "build"]]

-- cmake which-key bindings for c++ files
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "cpp" },
--   callback = function()
--     lvim.builtin.which_key.mappings["j"] = {
--       name = "C++",
--       -- Clean previous build system first before generating the new one
--       G = { "<cmd>CMakeGenerate!<cr>", "CMakeGenerate!" },
--       g = { "<cmd>CMakeGenerate build<cr>", "CMakeGenerate build" },
--       d = { "<cmd>CMakeGenerate Debug<cr>", "CMakeGenerate Debug" },
--       b = { "<cmd>CMakeBuild<cr>", "CMakeBuild" },
--       q = { "<cmd>CMakeClose<cr>", "CMakeClose" },
--       c = { "<cmd>CMakeClean<cr>", "CMakeClean" },
--       s = { "<cmd>CMakeSwitch build<cr>", "CMakeSwitch build" },
--       S = { "<cmd>CMakeSwitch Debug<cr>", "CMakeSwitch Debug" },
--     }
--   end,
-- })

lvim.builtin.which_key.mappings["j"] = {
  name = "CMake",
  -- Clean previous build system first before generating the new one
  G = { "<cmd>CMakeGenerate!<cr>", "CMakeGenerate!" },
  g = { "<cmd>CMakeGenerate build<cr>", "CMakeGenerate build" },
  d = { "<cmd>CMakeGenerate Debug<cr>", "CMakeGenerate Debug" },
  b = { "<cmd>CMakeBuild<cr>", "CMakeBuild" },
  q = { "<cmd>CMakeClose<cr>", "CMakeClose" },
  c = { "<cmd>CMakeClean<cr>", "CMakeClean" },
  s = { "<cmd>CMakeSwitch build<cr>", "CMakeSwitch build" },
  S = { "<cmd>CMakeSwitch Debug<cr>", "CMakeSwitch Debug" },
}

-- }}}

-- Github Copilot {{{

table.insert(lvim.plugins, {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    -- require("copilot").setup({})
    require('copilot').setup({
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>"
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        -- Default
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,

        -- ["*"] = false, -- disable for all other filetypes and ignore default 'filetypes'
        -- lua = true,
        -- cpp = true,
      },
      copilot_node_command = 'node', -- Node.js version must be > 16.x
      server_opts_overrides = {},
    })
  end,
})

-- }}}

-- vim:foldmethod=marker
