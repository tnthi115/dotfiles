-- Additional plugins

lvim.plugins = {
  -- Colorschemes
  -- { "ChristianChiarulli/nvcode-color-schemes.vim" },
  -- { "gruvbox-community/gruvbox" },
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "morhetz/gruvbox" },
  -- { "folke/tokyonight.nvim" },
  -- {"lunarvim/colorschemes"},
  -- {
  --   "sainnhe/gruvbox-material",
  --   -- lazy = true,
  -- },
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
  -- {
  --   "sindrets/diffview.nvim",
  --   cmd = "DiffviewOpen",
  -- },

  -- Markdown previewer
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    config = function()
      -- vim.g.mkdp_browser = "/usr/bin/firefox"
      -- vim.g.mkdp_theme = "light"
      vim.g.mkdp_auto_close = 0
    end,
  },

  -- Function signature viewer
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   lazy = true,
  --   config = function()
  --     require "user.lsp-signature"
  --   end,
  -- },

  -- Function signature help in cmp
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    event = "LspAttach",
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      table.insert(lvim.builtin.cmp.sources, { name = "nvim_lsp_signature_help" })
    end,
  },

  -- View colors from color codes
  -- {
  --   "norcalli/nvim-colorizer.lua",
  --   cmd = "ColorizerToggle",
  -- },
  {
    "NvChad/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    ft = { "conf", "yaml", "tmux" },
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue or blue
        RRGGBBAA = false, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = false, -- CSS rgb() and rgba() functions
        hsl_fn = false, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = false, -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
        virtualtext = "■",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = false,
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
    },
  },

  -- Incremental line number search
  -- {
  --   "nacro90/numb.nvim",
  --   -- lazy = true,
  --   event = "User FileOpened",
  --   config = function()
  --     require("numb").setup {
  --       show_numbers = true, -- Enable 'number' for the window while peeking
  --       show_cursorline = true, -- Enable 'cursorline' for the window while peeking
  --       hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
  --       number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
  --       centered_peeking = true, -- Peeked line will be centered relative to window
  --     }
  --   end,
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
  -- {
  --   "sakhnik/nvim-gdb",
  --   build = ":!./install.sh",
  --   ft = { "c", "cpp" },
  -- },

  -- zen-mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<CR>", desc = "Zen Mode" },
    },
    config = function()
      require "user.zen-mode"
    end,
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
    config = function()
      require "user.dressing"
    end,
  },

  -- todo-comments
  {
    "folke/todo-comments.nvim",
    event = "User FileOpened",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require "user.todo-comments"
    end,
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
  --   config = function()
  --     require("user.noice)
  --   end,
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
      -- vim.cmd [[hi TreesitterContext guibg=#282828]]
      vim.cmd [[hi TreesitterContext guibg=none]]
    end,
    keys = {
      {
        "<leader>ut",
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
      { "<leader>uar", "<cmd>CellularAutomaton make_it_rain<CR>", mode = "n", desc = "Make it Rain" },
      { "<leader>uag", "<cmd>CellularAutomaton game_of_life<CR>", mode = "n", desc = "Game of Life" },
      { "<leader>uas", "<cmd>CellularAutomaton scramble<CR>", mode = "n", desc = "Scramble" },
    },
  },

  -- refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    -- stylua: ignore
    keys = {
      -- visual mode
      {
        "<leader>re",
        "<Esc><cmd>lua require('refactoring').refactor('Extract Function')<CR>",
        mode = "v",
        desc =
        "Extract Function"
      },
      {
        "<leader>rf",
        "<Esc><cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
        mode = "v",
        desc =
        "Extract Function To File"
      },
      {
        "<leader>rv",
        "<Esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
        mode = "v",
        desc =
        "Extract Variable"
      },
      {
        "<leader>ri",
        "<Esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
        mode = "v",
        desc =
        "Inline Variable"
      },
      -- normal mode
      -- Inline variable can also pick up the identifier currently under the cursor without visual mode
      {
        "<leader>ri",
        "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
        mode = "n",
        desc =
        "Inline Variable"
      },
      {
        "<leader>rb",
        "<cmd>lua require('refactoring').refactor('Extract Block')<CR>",
        mode = "n",
        desc =
        "Extract Block"
      },
      -- Extract block doesn't need visual mode
      {
        "<leader>rB",
        "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
        mode = "n",
        desc =
        "Extract Block To File"
      },
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
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
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

  -- fidget - lsp progress info
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      text = {
        spinner = "dots",
      },
      window = {
        blend = 0,
      },
    },
  },

  -- tabnine - ai completion
  -- {
  --   "tzachar/cmp-tabnine",
  --   event = "InsertEnter",
  --   build = "./install.sh",
  --   dependencies = "hrsh7th/nvim-cmp",
  -- },

  -- vim-smoothie - smooth scrolling
  -- {
  --   "opalmay/vim-smoothie",
  --   keys = {
  --     "<C-j>",
  --     "<C-k>",
  --     "<C-D>",
  --     "<C-U>",
  --     "<C-F>",
  --     "<S-Down>",
  --     "<PageDown>",
  --     "<C-B>",
  --     "<S-Up>",
  --     "<PageUp>",
  --     "z+",
  --     "z^",
  --     "zt",
  --     "z<CR>",
  --     "z.",
  --     "zz",
  --     "z-",
  --     "zb",
  --     "{",
  --     "}",
  --     "<ScrollWheelDown>",
  --     "<ScrollWheelUp>",
  --   },
  --   config = function()
  --     vim.g.smoothie_hide_cursor = 1

  --     vim.cmd [[
  --     nnoremap <C-j> <cmd>call smoothie#do("\<C-D>") <CR>
  --     vnoremap <C-j> <cmd>call smoothie#do("\<C-D>") <CR>

  --     nnoremap <C-k> <cmd>call smoothie#do("\<C-U>") <CR>
  --     vnoremap <C-k> <cmd>call smoothie#do("\<C-U>") <CR>
  --     ]]

  --     vim.g.smoothie_remapped_commands = {
  --       "<C-D>",
  --       "<C-U>",
  --       "<C-F>",
  --       "<S-Down>",
  --       "<PageDown>",
  --       "<C-B>",
  --       "<S-Up>",
  --       "<PageUp>",
  --       "z+",
  --       "z^",
  --       "zt",
  --       "z<CR>",
  --       "z.",
  --       "zz",
  --       "z-",
  --       "zb",
  --       -- "H",
  --       -- "M",
  --       -- "L",
  --       "{",
  --       "}",
  --       -- "j",
  --       -- "k",
  --       "<ScrollWheelDown>",
  --       "<ScrollWheelUp>",
  --       -- "gg",
  --       -- "G",
  --       -- "n",
  --       -- "N",
  --       -- "#",
  --       -- "*",
  --       -- "g*",
  --       -- "g#",
  --     }

  --     -- The following options were originally removed from the README by psliwka #22:

  --     -- g:smoothie_update_interval: (default: 20) Time (in milliseconds) between subsequent screen/cursor position updates. Lower value produces smoother animation. Might be useful to increase it when running Vim over low-bandwidth/high-latency connections.
  --     vim.g.smoothie_update_interval = 20
  --     -- g:smoothie_speed_constant_factor: (default: 10) This value controls constant term of the velocity curve. Increasing this boosts primarily cursor speed at the end of animation.
  --     vim.g.smoothie_speed_constant_factor = 15
  --     -- g:smoothie_speed_linear_factor: (default: 10) This value controls linear term of the velocity curve. Increasing this boosts primarily cursor speed at the beginning of animation.
  --     vim.g.smoothie_speed_linear_factor = 15
  --     -- g:smoothie_speed_exponentiation_factor: (default: 0.9) This value controls exponent of the power function in the velocity curve. Generally should be less or equal to 1.0. Lower values produce longer but perceivably smoother animation.
  --     -- g:smoothie_redraw_at_finish: Force screen redraw when the animation is finished, which clears sporadic display artifacts which I encountered f.ex. when scrolling through buffers containing emoji. Enabled by default only if both editor and terminal (kitty) supports doing this in a glitch-free way.
  --   end,
  -- },

  -- Conventional commits completion in cmp
  {
    "davidsierradz/cmp-conventionalcommits",
    ft = { "gitcommit" },
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      require "user.conventionalcommits"
    end,
  },

  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   keys = {
  --     { "<leader>E", "<cmd>Telescope file_browser<CR>", desc = "File Browser" },
  --   },
  --   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  --   config = function()
  --     local actions = require("lvim.utils.modules").require_on_exported_call "telescope.actions"
  --     lvim.builtin.telescope.extensions.file_browser = {
  --       theme = "ivy",
  --       -- disables netrw and use telescope-file-browser in its place
  --       hijack_netrw = true,
  --       hidden = true,
  --       mappings = {
  --         ["n"] = {
  --           ["l"] = actions.select_default,
  --         },
  --       },
  --     }
  --     require("telescope").load_extension "file_browser"
  --   end,
  -- },

  -- Ensure installed for all Mason tools, not just LSPs
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "LspAttach",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    keys = {
      { "<leader>lu", "<cmd>MasonToolsUpdate<CR>", desc = "Mason Tools Update" },
    },
    config = function()
      require("mason-tool-installer").setup {
        -- a list of all tools you want to ensure are installed upon
        -- start; they should be the names Mason uses for each tool
        ensure_installed = {

          -- you can pin a tool to a particular version
          -- { "golangci-lint", version = "v1.47.0" },

          -- you can turn off/on auto_update per tool
          -- { "bash-language-server", auto_update = true },

          -- Shell
          "bash-language-server",
          "beautysh",
          "shellcheck",

          -- Spelling
          "codespell",

          -- Commit
          "commitlint",

          -- Dockerfile
          "dockerfile-language-server",

          -- Golang
          "gopls",
          "golangci-lint",
          "golangci-lint-langserver",
          "gofumpt",
          "goimports-reviser",
          "gomodifytags",
          "gotests",
          "impl",
          "iferr",
          "delve",
          -- "golines",

          -- Java
          "jdtls",
          "google-java-format",
          "java-debug-adapter",
          "java-test",

          -- Json
          "json-lsp",

          -- Lua
          "lua-language-server",
          "stylua",

          -- Markdown
          "marksman",
          "markdownlint",

          -- Python
          "pyright",
          "ruff-lsp",
          -- "ruff",
          "mypy",
          "usort",
          "black",
          "debugpy",

          -- SQL
          "sqlls",
          "sqlfluff",
          "sqlfmt",

          -- Yaml
          "yaml-language-server",
        },

        -- if set to true this will check each tool for updates. If updates
        -- are available the tool will be updated. This setting does not
        -- affect :MasonToolsUpdate or :MasonToolsInstall.
        -- Default: false
        auto_update = true,

        -- automatically install / update on startup. If set to false nothing
        -- will happen on startup. You can use :MasonToolsInstall or
        -- :MasonToolsUpdate to install tools and check for updates.
        -- Default: true
        run_on_start = true,

        -- set a delay (in ms) before the installation starts. This is only
        -- effective if run_on_start is set to true.
        -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
        -- Default: 0
        -- start_delay = 3000, -- 3 second delay

        -- Only attempt to install if 'debounce_hours' number of hours has
        -- elapsed since the last time Neovim was started. This stores a
        -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
        -- This is only relevant when you are using 'run_on_start'. It has no
        -- effect when running manually via ':MasonToolsInstall' etc....
        -- Default: nil
        -- debounce_hours = 5, -- at least 5 hours between attempts to install/update
      }

      -- Create autocommand to automatically installed missing tools on the LspAttach event.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          vim.cmd "MasonToolsInstall"
          vim.cmd "MasonToolsUpdate"
        end,
      })
    end,
  },

  -- neogen - docstring/annotation toolkit for multiple languages using treesitter
  {
    "danymat/neogen",
    event = "LspAttach",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = {
      { "<leader>ng", "<cmd>lua require('neogen').generate()<CR>", desc = "Generate annotation" },
      {
        "<leader>nf",
        "<cmd>lua require('neogen').generate({ type = 'func' })<CR>",
        desc = "Generate function annotation",
      },
      {
        "<leader>nc",
        "<cmd>lua require('neogen').generate({ type = 'class' })<CR>",
        desc = "Generate class annotation",
      },
      { "<leader>nt", "<cmd>lua require('neogen').generate({ type = 'type' })<CR>", desc = "Generate type annotation" },
      { "<leader>nF", "<cmd>lua require('neogen').generate({ type = 'file' })<CR>", desc = "Generate file annotation" },
    },
    config = function()
      require "user.neogen"
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
}
