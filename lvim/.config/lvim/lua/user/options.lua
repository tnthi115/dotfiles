-- General lvim builtin plugin settings

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

-- Configure alpha dashboard
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

-- Show hidden files in telescope for Project
lvim.builtin.project.show_hidden = true

-- Make sure all keymappings show up, especially those set in Lazy
lvim.builtin.which_key.setup.ignore_missing = false

-- Options

local options = {
  background = "dark",
  backup = false,            -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1,             -- more space in the neovim command line for displaying messages
  -- colorcolumn = "99999", -- fixes indentline for now
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,       -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  -- foldmethod = "manual", -- folding set to "expr" for treesitter based folding
  -- foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  guifont = "monospace:h17",           -- the font used in graphical neovim applications
  hidden = true,                       -- required to keep multiple buffers and open multiple buffers
  hlsearch = true,                     -- highlight all matches on previous search pattern, use space h to unhighlight everything
  incsearch = true,
  ignorecase = true,                   -- ignore case in search patterns
  mouse = "a",                         -- allow the mouse to be used in neovim
  pumheight = 10,                      -- pop up menu height
  showmode = false,                    -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                     -- always show tabs
  smartcase = true,                    -- smart case
  smartindent = true,                  -- make indenting smarter again
  autoindent = true,
  splitbelow = true,                   -- force all horizontal splits to go below current window
  splitright = true,                   -- force all vertical splits to go to the right of current window
  swapfile = false,                    -- creates a swapfile
  termguicolors = true,                -- set term gui colors (most terminals support this)
  timeoutlen = 100,                    -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true,                        -- set the title of window to the value of the titlestring
  -- titlestring = "%<%F%=%l/%L - nvim", -- what the title of the window will be set to
  titlestring = "%<%F | %l/%L - nvim", -- what the title of the window will be set to
  undodir = vim.fn.stdpath "cache" .. "/undo",
  undofile = true,                     -- enable persistent undo
  updatetime = 250,                    -- faster completion
  writebackup = false,                 -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
  expandtab = true,                    -- convert tabs to spaces
  shiftwidth = 2,                      -- the number of spaces inserted for each indentation
  softtabstop = 2,                     -- insert 2 spaces for a tab
  cursorline = true,                   -- highlight the current line
  number = true,                       -- set numbered lines
  relativenumber = true,               -- set relative numbered lines
  numberwidth = 4,                     -- set number column width to 2 {default 4}
  signcolumn = "yes",                  -- always show the sign column otherwise it would shift the text each time
  wrap = false,                        -- display lines as one long line
  spell = false,
  spelllang = "en",
  scrolloff = 8, -- is one of my fav
  sidescrolloff = 8,
  -- fillchars = vim.opt.fillchars + "diff:╱",
  fillchars = vim.opt.fillchars + "diff:/", -- TODO this gets overridden by lvim.transparent_window = true
  -- fillchars = { diff = "╱" },
  -- vim.cmd("set, winbar=%=%m\ %f") -- set winbar (TODO: broken syntax)
  -- foldlevel = 0,
  -- foldmethod = "marker",
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  foldlevelstart = 99,
  list = true,
  -- listchars = { eol = "↲", tab = "▸ ", trail = "·" },
  listchars = { tab = "▸ ", trail = "·" },
  showbreak = "↪",
  laststatus = 3,
  ruler = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
