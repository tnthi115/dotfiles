-- General lvim builtin plugin settings {{{

lvim.log.level = "warn"
-- lvim.format_on_save = false

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
-- lvim.builtin.nvimtree.active = false
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
-- vim.opt.listchars = { eol = "↲", tab = "▸ ", trail = "·" }
vim.opt.listchars = { tab = "▸ ", trail = "·" }
vim.opt.showbreak = "↪"

-- }}}
