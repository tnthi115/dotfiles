-- Additional plugins

lvim.plugins = {
  -- Colorschemes
  -- { "ChristianChiarulli/nvcode-color-schemes.vim" },
  -- { "gruvbox-community/gruvbox" },
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "morhetz/gruvbox" },
  -- { "folke/tokyonight.nvim" },
  -- {"lunarvim/colorschemes"},
  {
    "sainnhe/gruvbox-material",
    -- lazy = true,
  },
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
    config = function()
      vim.g.mkdp_browser = "/usr/bin/firefox"
      -- vim.g.mkdp_theme = "light"
      vim.g.mkdp_auto_close = 0
    end,
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
  -- {
  --   "nacro90/numb.nvim",
  --   lazy = true,
  --   -- config = function()
  --   --   require("numb").setup {
  --   --     show_numbers = true, -- Enable 'number' for the window while peeking
  --   --     show_cursorline = true, -- Enable 'cursorline' for the window while peeking
  --   --     hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
  --   --     number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
  --   --     centered_peeking = true, -- Peeked line will be centered relative to window
  --   --   }
  --   -- end,
  -- },

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
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<CR>", desc = "Zen Mode" },
    },
  },

  -- C++ clangd and cmake integration made lazy
  -- {
  --   "p00f/clangd_extensions.nvim",
  --   ft = { "c", "cpp" },
  -- },
  -- {
  --   "cdelledonne/vim-cmake",
  --   ft = { "cpp", "cmake" },
  -- },

  -- prettier vim.ui.select and vim.ui.input
  {
    "stevearc/dressing.nvim",
    event = "User FileOpened",
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

  -- todo-comments
  {
    "folke/todo-comments.nvim",
    event = "User FileOpened",
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- vim-glsl
  -- {
  --   "tikhomirov/vim-glsl",
  --   ft = { "glsl" },
  -- },

  -- noice
  -- {
  --   "folke/noice.nvim",
  --   event = "UIEnter",
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- }

  -- nvim-treesitter-context
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "User FileOpened",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
        trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
      }
      -- vim.cmd[[hi TreesitterContextBottom gui=underline guisp=Grey]]
      vim.cmd [[hi TreesitterContext guibg=#282828]]
    end,
    keys = {
      {
        "<leader>Tt",
        "<cmd>TSContextToggle<CR>",
        mode = "n",
        desc = "Toggle Treesitter Context",
      },
    },
  },

  -- cellular-automaton for fun animations
  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
    keys = {
      { "<leader>bar", "<cmd>CellularAutomaton make_it_rain<CR>", mode = "n", desc = "Make it Rain" },
      { "<leader>bag", "<cmd>CellularAutomaton game_of_life<CR>", mode = "n", desc = "Game of Life" },
    },
  },

  -- refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    -- stylua: ignore
    keys = {
      -- visual mode
      { "<leader>re", "<Esc><cmd>lua require('refactoring').refactor('Extract Function')<CR>", mode = "v", desc = "Extract Function" },
      { "<leader>rf", "<Esc><cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", mode = "v", desc = "Extract Function To File" },
      { "<leader>rv", "<Esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>", mode = "v", desc = "Extract Variable" },
      { "<leader>ri", "<Esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>", mode = "v", desc = "Inline Variable" },
      -- normal mode
      -- Inline variable can also pick up the identifier currently under the cursor without visual mode
      { "<leader>ri", "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", mode = "n", desc = "Inline Variable" },
      { "<leader>rb", "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", mode = "n", desc = "Extract Block" },
      -- Extract block doesn't need visual mode
      { "<leader>rB", "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", mode = "n", desc = "Extract Block To File" },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("refactoring").setup {
        prompt_func_return_type = {
          go = true,
          java = true,
          cpp = true,
          c = true,
          h = false,
          hpp = false,
          cxx = false,
        },
        prompt_func_param_type = {
          go = true,
          java = true,
          cpp = true,
          c = true,
          h = false,
          hpp = false,
          cxx = false,
        },
        printf_statements = {},
        print_var_statements = {},
      }
    end,
  },

  -- search/replace in multiple files
  {
    "nvim-pack/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>ss", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
    opts = {
      default = {
        find = {
          cmd = "rg",
          options = { "ignore-case", "hidden" },
        },
      },
    },
  },

  -- vim-surround
  {
    -- "tpope/vim-surround",
    "kylechui/nvim-surround",
    -- version = "*", -- Use for stability; omit to use `main` branch for the latest features
    keys = {
      "cs",
      "ds",
      "ys",
    },
    opts = {},
    -- config = function()
    --   require("nvim-surround").setup {}
    -- end,
  },
}
