-- Additional plugins

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
  -- { "sainnhe/everforest" },
  -- { "tiagovla/tokyodark.nvim" },
  -- { "shaunsingh/moonlight.nvim" },
  -- { "rebelot/kanagawa.nvim" },
  -- { "frenzyexists/aquarium-vim" },
  -- { "catppuccin/nvim", name = "catppuccin" },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  -- },

  -- Error diagnostics
  -- {
  --   "folke/trouble.nvim",
  --   cmd = "TroubleToggle",
  -- },

  -- Git diffview
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },

  -- Markdown previewer
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
  },

  -- Function signature viewer
  {
    "ray-x/lsp_signature.nvim",
    lazy = true,
  },

  -- View colors from color codes
  {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
  },

  -- Incremental line number search
  {
    "nacro90/numb.nvim",
    lazy = true,
  },

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

  -- nvim gdb
  {
    "sakhnik/nvim-gdb",
    build = ":!./install.sh",
    ft = { "c", "cpp" },
  },
  -- {
  --   "folke/zen-mode.nvim",
  --   config = function()
  --     require("zen-mode").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --       window = {
  --         backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
  --         -- height and width can be:
  --         -- * an absolute number of cells when > 1
  --         -- * a percentage of the width / height of the editor when <= 1
  --         -- * a function that returns the width or the height
  --         width = 120, -- width of the Zen window
  --         height = 1, -- height of the Zen window
  --         -- by default, no options are changed for the Zen window
  --         -- uncomment any of the options below, or add other vim.wo options you want to apply
  --         options = {
  --           -- signcolumn = "no", -- disable signcolumn
  --           -- number = false, -- disable number column
  --           -- relativenumber = false, -- disable relative numbers
  --           -- cursorline = false, -- disable cursorline
  --           -- cursorcolumn = false, -- disable cursor column
  --           -- foldcolumn = "0", -- disable fold column
  --           -- list = false, -- disable whitespace characters
  --         },
  --       },
  --       plugins = {
  --         -- disable some global vim options (vim.o...)
  --         -- comment the lines to not apply the options
  --         options = {
  --           enabled = true,
  --           ruler = false, -- disables the ruler text in the cmd line area
  --           showcmd = false, -- disables the command in the last line of the screen
  --         },
  --         twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
  --         gitsigns = { enabled = false }, -- disables git signs
  --         tmux = { enabled = false }, -- disables the tmux statusline
  --         -- this will change the font size on kitty when in zen mode
  --         -- to make this work, you need to set the following kitty options:
  --         -- - allow_remote_control socket-only
  --         -- - listen_on unix:/tmp/kitty
  --         kitty = {
  --           enabled = false,
  --           font = "+4", -- font size increment
  --         },
  --         -- this will change the font size on alacritty when in zen mode
  --         -- requires  Alacritty Version 0.10.0 or higher
  --         -- uses `alacritty msg` subcommand to change font size
  --         alacritty = {
  --           enabled = false,
  --           font = "14", -- font size
  --         },
  --       },
  --       -- callback where you can add custom code when the Zen window opens
  --       -- on_open = function(win)
  --       -- end,
  --       -- callback where you can add custom code when the Zen window closes
  --       -- on_close = function()
  --       -- end,
  --     }
  --   end
  -- },

  -- C++ clangd and cmake integration made lazy
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
  },
  {
    "cdelledonne/vim-cmake",
    ft = { "c", "cpp" },
  },

  -- prettier vim.ui.select and vim.ui.input
  {
    "stevearc/dressing.nvim",
    -- lazy = true,
    -- init = function()
    --   ---@diagnostic disable-next-line: duplicate-set-field
    --   vim.ui.select = function(...)
    --     require("lazy").load({ plugins = { "dressing.nvim" } })
    --     return vim.ui.select(...)
    --   end
    --   ---@diagnostic disable-next-line: duplicate-set-field
    --   vim.ui.input = function(...)
    --     require("lazy").load({ plugins = { "dressing.nvim" } })
    --     return vim.ui.input(...)
    --   end
    -- end,
  },
  -- Lua
  {
    "folke/todo-comments.nvim",
    event = "User FileOpened",
    dependencies = "nvim-lua/plenary.nvim",
  },
  -- vim-glsl
  {
    "tikhomirov/vim-glsl",
    ft = { "glsl" },
  },
}
