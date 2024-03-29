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
  {
    "folke/trouble.nvim",
    event = "LspAttach",
    cmd = "TroubleToggle",
    config = function()
      local which_key_ok, which_key = pcall(require, "which-key")
      if not which_key_ok then
        return
      end
      local opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      }
      local mappings = {
        l = {
          E = {
            name = "Trouble (Errors)",
            r = { "<cmd>Trouble lsp_references<cr>", "References" },
            f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
            d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
            q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
            l = { "<cmd>Trouble loclist<cr>", "LocationList" },
            w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
          },
        },
      }
      which_key.register(mappings, opts)
    end,
  },

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
      { "<leader>ut", "<cmd>TSContextToggle<CR>", mode = "n", desc = "Toggle Treesitter Context" },
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
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    keys = { "cs", "ds", "ys" },
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
          "shfmt",
          "shellcheck",

          -- Spelling
          "codespell",

          -- Commit
          "commitlint",

          -- Dockerfile
          "dockerfile-language-server",

          -- C++
          -- "clangd",
          -- "cpplint",
          -- "clang-format",
          -- "codelldb",

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
          -- vim.cmd "MasonToolsInstall"
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
    -- stylua: ignore
    keys = {
      { "<leader>nn", "<cmd>lua require('neogen').generate()<CR>", desc = "Generate annotation" },
      { "<leader>nf", "<cmd>lua require('neogen').generate({ type = 'func' })<CR>", desc = "Generate function annotation" },
      { "<leader>nc", "<cmd>lua require('neogen').generate({ type = 'class' })<CR>", desc = "Generate class annotation" },
      { "<leader>nt", "<cmd>lua require('neogen').generate({ type = 'type' })<CR>", desc = "Generate type annotation" },
      { "<leader>nF", "<cmd>lua require('neogen').generate({ type = 'file' })<CR>", desc = "Generate file annotation" },
    },
    config = function()
      require "user.neogen"
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },

  -- inlay-hints
  -- {
  --   "simrat39/inlay-hints.nvim",
  --   event = "LspAttach",
  --   config = function()
  --     require("inlay-hints").setup {
  --       -- renderer to use
  --       -- possible options are dynamic, eol, virtline and custom
  --       renderer = "inlay-hints/render/dynamic",

  --       hints = {
  --         parameter = {
  --           show = true,
  --           highlight = "Comment",
  --         },
  --         type = {
  --           show = true,
  --           highlight = "Comment",
  --         },
  --       },

  --       -- Only show inlay hints for the current line
  --       only_current_line = false,

  --       eol = {
  --         -- whether to align to the extreme right or not
  --         right_align = false,

  --         -- padding from the right if right_align is true
  --         right_align_padding = 7,

  --         parameter = {
  --           separator = ", ",
  --           format = function(hints)
  --             return string.format(" <- (%s)", hints)
  --           end,
  --         },

  --         type = {
  --           separator = ", ",
  --           format = function(hints)
  --             return string.format(" » (%s)", hints)
  --           end,
  --         },
  --       },
  --     }
  --   end,
  -- },

  -- ollama integration
  {
    "David-Kunz/gen.nvim",
    event = "User FileOpened",
    config = function()
      -- require("gen").model = "mistral:latest"

      local which_key_ok, which_key = pcall(require, "which-key")
      if not which_key_ok then
        return
      end

      local opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      }

      local mappings = {
        G = {
          name = "Gen",
          g = { "<cmd>Gen<CR>", "Gen" },
          a = { "<cmd>Gen Ask<CR>", "Gen Ask" },
          c = { "<cmd>Gen Change<CR>", "Gen Change" },
          G = { "<cmd>Gen Enhance_Grammar_Spelling<CR>", "Gen Enhance_Grammar_Spelling" },
          w = { "<cmd>Gen Enhance_Wording<CR>", "Gen Enhance_Wording" },
          s = { "<cmd>Gen Make_Consice<CR>", "Gen Make_Consice" },
          l = { "<cmd>Gen Make_List<CR>", "Gen Make_List" },
          t = { "<cmd>Gen Make_Table<CR>", "Gen Make_Table" },
          r = { "<cmd>Gen Review_Code<CR>", "Gen Review_Code" },
          e = { "<cmd>Gen Enhance_Code<CR>", "Gen Enhance_Code" },
          C = { "<cmd>Gen Change_Code<CR>", "Gen Change_Code" },
        },
      }

      local vopts = {
        mode = "v", -- NORMAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      }

      local vmappings = {
        G = {
          name = "Gen",
          g = { "<cmd>'<,'>Gen<CR>", "Gen" },
          a = { "<cmd>'<,'>Gen Ask<CR>", "Gen Ask" },
          c = { "<cmd>'<,'>Gen Change<CR>", "Gen Change" },
          G = { "<cmd>'<,'>Gen Enhance_Grammar_Spelling<CR>", "Gen Enhance_Grammar_Spelling" },
          w = { "<cmd>'<,'>Gen Enhance_Wording<CR>", "Gen Enhance_Wording" },
          s = { "<cmd>'<,'>Gen Make_Consice<CR>", "Gen Make_Consice" },
          l = { "<cmd>'<,'>Gen Make_List<CR>", "Gen Make_List" },
          t = { "<cmd>'<,'>Gen Make_Table<CR>", "Gen Make_Table" },
          r = { "<cmd>'<,'>Gen Review_Code<CR>", "Gen Review_Code" },
          e = { "<cmd>'<,'>Gen Enhance_Code<CR>", "Gen Enhance_Code" },
          C = { "<cmd>'<,'>Gen Change_Code<CR>", "Gen Change_Code" },
        },
      }

      which_key.register(mappings, opts)
      which_key.register(vmappings, vopts)
    end,
  },

  -- opgt - fork of jackMort/ChatGPT.nvim that uses ollama
  {
    "huynle/ogpt.nvim",
    event = "User FileOpened",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      -- "nvim-telescope/telescope.nvim",
    },
    config = function()
      local opts = {
        api_host_cmd = "echo http://localhost:11434",
        edit_with_instructions = {
          keymaps = {
            use_output_as_input = "<C-a>",
          },
        },
        api_params = {
          model = "mistral:7b-instruct",
        },
        api_edit_params = {
          model = "mistral:7b-instruct",
        },
        -- show_quickfixes_cmd = "copen",
        -- add custom actions.json
        actions_paths = {},
      }

      require("ogpt").setup(opts)

      local which_key_ok, which_key = pcall(require, "which-key")
      if not which_key_ok then
        return
      end

      opts = {
        mode = { "n", "v" }, -- NORMAL and VISUAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      }

      local mappings = {
        o = {
          name = "OGPT",
          c = { "<cmd>OGPT<CR>", "OGPT" },
          a = { "<cmd>OGPTActAs<CR>", "OGPTActAs" },
          e = { "<cmd>OGPTEditWithInstruction<CR>", "Edit with instruction" },
          C = { "<cmd>OGPTRun complete_code<CR>", "Complete Code" },
          G = { "<cmd>OGPTRun grammar_correction<CR>", "Grammar Correction" },
          t = { "<cmd>OGPTRun translate<CR>", "Translate" },
          k = { "<cmd>OGPTRun keywords<CR>", "Keywords" },
          d = { "<cmd>OGPTRun docstring<CR>", "Docstring" },
          A = { "<cmd>OGPTRun add_tests<CR>", "Add Tests" },
          o = { "<cmd>OGPTRun optimize_code<CR>", "Optimize Code" },
          s = { "<cmd>OGPTRun summarize<CR>", "Summarize" },
          f = { "<cmd>OGPTRun fix_bugs<CR>", "Fix Bugs" },
          x = { "<cmd>OGPTRun explain_code<CR>", "Explain Code" },
          r = { "<cmd>OGPTRun roxygen_edit<CR>", "Roxygen Edit" },
          l = { "<cmd>OGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
        },
      }

      which_key.register(mappings, opts)
    end,
  },

  -- flash.nvim - navigate code with search labels, enhanced character motions, and Treesitter integration
  {
    "folke/flash.nvim",
    event = "User FileOpened",
    ---@type Flash.Config
    opts = {
      modes = {
        -- `f`, `F`, `t`, `T`, `;` and `,` motions
        char = {
          enabled = false,
          jump_labels = true,
        },
      },
    },
    -- stylua: ignore
    keys = {
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- gitlab integration
  {
    "harrisoncramer/gitlab.nvim",
    event = "User FileOpened",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
      enabled = true,
    },
    build = function()
      require("gitlab.server").build(true)
    end, -- Builds the Go binary
    config = function()
      require("gitlab").setup {
        port = nil, -- The port of the Go server, which runs in the background, if omitted or `nil` the port will be chosen automatically
        log_path = vim.fn.stdpath "cache" .. "/gitlab.nvim.log", -- Log path for the Go server
        config_path = nil, -- Custom path for `.gitlab.nvim` file, please read the "Connecting to Gitlab" section
        debug = { go_request = false, go_response = false }, -- Which values to log
        attachment_dir = nil, -- The local directory for files (see the "summary" section)
        popup = { -- The popup for comment creation, editing, and replying
          exit = "<Esc>",
          perform_action = "<CR>", -- Once in normal mode, does action (like saving comment or editing description, etc)
          perform_linewise_action = "C-<CR>", -- Once in normal mode, does the linewise action (see logs for this job, etc)
          width = "40%",
          height = "60%",
          border = "rounded", -- One of "rounded", "single", "double", "solid"
          opacity = 1.0, -- From 0.0 (fully transparent) to 1.0 (fully opaque)
          comment = nil, -- Individual popup overrides, e.g. { width = "60%", height = "80%", border = "single", opacity = 0.85 },
          edit = nil,
          note = nil,
          pipeline = nil,
          reply = nil,
        },
        discussion_tree = { -- The discussion tree that holds all comments
          blacklist = {}, -- List of usernames to remove from tree (bots, CI, etc)
          jump_to_file = "o", -- Jump to comment location in file
          jump_to_reviewer = "m", -- Jump to the location in the reviewer window
          edit_comment = "e", -- Edit comment
          delete_comment = "dd", -- Delete comment
          reply = "r", -- Reply to comment
          toggle_node = "t", -- Opens or closes the discussion
          toggle_resolved = "x", -- Toggles the resolved status of the whole discussion
          position = "bottom", -- "top", "right", "bottom" or "left"
          size = "20%", -- Size of split
          relative = "editor", -- Position of tree split relative to "editor" or "window"
          resolved = "✓", -- Symbol to show next to resolved discussions
          unresolved = "✖", -- Symbol to show next to unresolved discussions
          tree_type = "simple", -- Type of discussion tree - "simple" means just list of discussions, "by_file_name" means file tree with discussions under file
        },
        info = { -- Show additional fields in the summary pane
          enabled = true,
          horizontal = false, -- Display metadata to the left of the summary rather than underneath
          fields = { -- The fields listed here will be displayed, in whatever order you choose
            "author",
            "created_at",
            "updated_at",
            "merge_status",
            "draft",
            "conflicts",
            "assignees",
            "reviewers",
            "branch",
            "pipeline",
          },
        },
        discussion_sign_and_diagnostic = {
          skip_resolved_discussion = false,
          skip_old_revision_discussion = true,
        },
        discussion_sign = {
          -- See :h sign_define for details about sign configuration.
          enabled = true,
          text = "💬",
          linehl = nil,
          texthl = nil,
          culhl = nil,
          numhl = nil,
          priority = 20, -- Priority of sign, the lower the number the higher the priority
          helper_signs = {
            -- For multiline comments the helper signs are used to indicate the whole context
            -- Priority of helper signs is lower than the main sign (-1).
            enabled = true,
            start = "↑",
            mid = "|",
            ["end"] = "↓",
          },
        },
        discussion_diagnostic = {
          -- If you want to customize diagnostics for discussions you can make special config
          -- for namespace `gitlab_discussion`. See :h vim.diagnostic.config
          enabled = true,
          severity = vim.diagnostic.severity.INFO,
          code = nil, -- see :h diagnostic-structure
          display_opts = {}, -- see opts in vim.diagnostic.set
        },
        pipeline = {
          created = "",
          pending = "",
          preparing = "",
          scheduled = "",
          running = "ﰌ",
          canceled = "ﰸ",
          skipped = "ﰸ",
          success = "✓",
          failed = "",
        },
        colors = {
          discussion_tree = {
            username = "Keyword",
            date = "Comment",
            chevron = "DiffviewNonText",
            directory = "Directory",
            directory_icon = "DiffviewFolderSign",
            file_name = "Normal",
          },
        },
      }

      local which_key_ok, which_key = pcall(require, "which-key")
      if not which_key_ok then
        return
      end

      local opts = {
        mode = { "n", "v" }, -- NORMAL and VISUAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      }

      local mappings = {
        m = {
          name = "GitLab",
          s = { "<cmd>lua require('gitlab').summary()<CR>", "Summary" },
          A = { "<cmd>lua require('gitlab').approve()<CR>", "Approve" },
          R = { "<cmd>lua require('gitlab').revoke()<CR>", "Revoke" },
          m = {
            "<cmd>lua require('gitlab').move_to_discussion_tree_from_diagnostic()<CR>",
            "Move to discussion tree from diagnostic",
          },
          n = { "<cmd>lua require('gitlab').create_note()<CR>", "Create note" },
          d = { "<cmd>lua require('gitlab').toggle_discussions()<CR>", "Toggle discussions" },
          p = { "<cmd>lua require('gitlab').pipeline()<CR>", "Pipeline" },
          o = { "<cmd>lua require('gitlab').open_in_browser()<CR>", "Open in browser" },
          r = {
            name = "Review",
            r = { "<cmd>lua require('gitlab').review()<CR>", "Review" },
            a = { "<cmd>lua require('gitlab').add_reviewer()<CR>", "Add reviewer" },
            d = { "<cmd>lua require('gitlab').delete_reviewer()<CR>", "Delete reviewer" },
          },
          c = {
            name = "Comment",
            c = { "<cmd>lua require('gitlab').create_comment()<CR>", "Create comment" },
            m = { "<cmd>lua require('gitlab').create_multiline_comment()<CR>", "Create multiline comment" },
            s = { "<cmd>lua require('gitlab').create_comment_suggestion()<CR>", "Create comment suggestion" },
          },
          a = {
            name = "Assignee",
            a = { "<cmd>lua require('gitlab').add_assignee()<CR>", "Add assignee" },
            d = { "<cmd>lua require('gitlab').delete_assignee()<CR>", "Delete assignee" },
          },
        },
      }

      which_key.register(mappings, opts)
    end,
    -- stylua: ignore
    -- keys = {
    --   { "<leader>gLrr", "<cmd>lua require('gitlab').review()<CR>", desc = "Review" },
    --   { "<leader>gLra", "<cmd>lua require('gitlab').add_reviewer()<CR>", desc = "Add reviewer" },
    --   { "<leader>gLrd", "<cmd>lua require('gitlab').delete_reviewer()<CR>", desc = "Delete reviewer" },
    --   { "<leader>gLs", "<cmd>lua require('gitlab').summary()<CR>", desc = "Summary" },
    --   { "<leader>gLA", "<cmd>lua require('gitlab').approve()<CR>", desc = "Approve" },
    --   { "<leader>gLR", "<cmd>lua require('gitlab').revoke()<CR>", desc = "Revoke" },
    --   { "<leader>gLcc", "<cmd>lua require('gitlab').create_comment()<CR>", desc = "Create comment" },
    --   { "<leader>gLcm", "<cmd>lua require('gitlab').create_multiline_comment()<CR>", desc = "Create multiline comment" },
    --   { "<leader>gLcs", "<cmd>lua require('gitlab').create_comment_suggestion()<CR>", desc = "Create comment suggestion" },
    --   { "<leader>gLm", "<cmd>lua require('gitlab').move_to_discussion_tree_from_diagnostic()<CR>", desc = "Move to discussion tree from diagnostic" },
    --   { "<leader>gLn", "<cmd>lua require('gitlab').create_note()<CR>", desc = "Create note" },
    --   { "<leader>gLd", "<cmd>lua require('gitlab').toggle_discussions()<CR>", desc = "Toggle discussions" },
    --   { "<leader>gLaa", "<cmd>lua require('gitlab').add_assignee()<CR>", desc = "Add assignee" },
    --   { "<leader>gLad", "<cmd>lua require('gitlab').delete_assignee()<CR>", desc = "Delete assignee" },
    --   { "<leader>gLp", "<cmd>lua require('gitlab').pipeline()<CR>", desc = "Pipeline" },
    --   { "<leader>gLo", "<cmd>lua require('gitlab').open_in_browser()<CR>", desc = "Open in browser" },
    -- },
  },

  -- gitlab duo code suggestions
  -- for some reason I get a warning when there are other language servers active (e.g. doesn't work when pyright is active):
  --   warning: multiple different client offset_encodings detected for buffer, this is not supported yet
  -- but it still works I guess?
  {
    "git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git",
    event = { "BufReadPre", "BufNewFile" }, -- Activate when a file is created/opened
    -- event = { "LspAttach" }, -- Doesn't work. Needs to be loaded earlier...
    ft = { "go", "python" }, -- Activate when a supported filetype is open. For supported languages, see https://docs.gitlab.com/ee/user/project/repository/code_suggestions/index.html#supported-languages
    cond = function()
      -- Only activate is token is present in environment variable (remove to use interactive workflow)
      -- I have this shell env var set for gitlab.nvim already, so I can reuse the token here.
      return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ""
    end,
    -- opts = {
    --   statusline = {
    --     enabled = true, -- Hook into the builtin statusline to indicate the status of the GitLab Duo Code Suggestions integration
    --   },
    -- },
    config = function()
      require("gitlab").setup()

      local notify = vim.notify
      vim.notify = function(msg, ...)
        if msg:match "warning: multiple different client offset_encodings" then
          return
        end

        notify(msg, ...)
      end
    end,
  },
}
