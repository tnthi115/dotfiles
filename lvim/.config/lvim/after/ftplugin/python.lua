-- -- Make sure to run the following:
-- -- :MasonInstall pyright flake8 black debugpy
-- -- swap out flake8 for ruff and mypy
-- -- :MasonInstall pyright ruff-lsp ruff mypy usort black debugpy
-- -- Install pytest

-- ------------------------
-- -- Treesitter
-- ------------------------
-- vim.list_extend(lvim.builtin.treesitter.ensure_installed, {
--   "python",
-- })

-- ------------------------
-- -- Plugins
-- ------------------------
-- table.insert(lvim.plugins, {
--   "ChristianChiarulli/swenv.nvim",
--   ft = "python",
-- })
-- table.insert(lvim.plugins, {
--   "mfussenegger/nvim-dap-python",
--   ft = "python",
-- })
-- table.insert(lvim.plugins, {
--   "nvim-neotest/neotest-python",
--   ft = "python",
--   dependencies = "nvim-neotest/neotest",
-- })

------------------------
-- Formatting
------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, { name = "usort" } }
-- lvim.format_on_save.enabled = true
-- lvim.format_on_save.pattern = { "*.py" }

------------------------
-- Linting
------------------------
local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup { { command = "flake8", filetypes = { "python" } } }
linters.setup {
  -- { command = "ruff", filetypes = { "python" }, extra_args = { "--extend-select=W,N,S,A,C4,SIM,TCH,PL,RUF" } },
  {
    command = "mypy",
    filetypes = { "python" },
    -- Add --python-executable flag so that if we are using a virtual environment, we use the python interpreter of that environment instead of the global one.
    -- Equivalent command: mypy --strict --python-executable=$(which python)
    extra_args = { "--strict", "--python-executable=" .. io.popen("which python"):read("*a"):gsub("[\n\r]", "") },
  },
  -- { command = "mypy", filetypes = { "python" } },
}

------------------------
-- Dap
------------------------
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

------------------------
-- LSP
------------------------
-- Settings used to be managed by LspSettings, now moved here.

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })

local lsp_manager = require "lvim.lsp.manager"

lsp_manager.setup("pyright", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  single_file_support = true,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false,
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace", -- openFilesOnly, workspace
        typeCheckingMode = "basic", -- off, basic, strict
        useLibraryCodeForTypes = true,
      },
    },
  },
})

lsp_manager.setup("ruff_lsp", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    -- Disable hover in favor of Pyright.
    client.server_capabilities.hoverProvider = false
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = { "--extend-select=W,N,D,S,A,C4,SIM,TCH,PL,AIR,RUF" },
    },
  },
})

------------------------
-- Testing
------------------------
require("neotest").setup {
  adapters = {
    require "neotest-python" {
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    },
  },
}

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  -- buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  buffer = vim.api.nvim_get_current_buf(), -- Local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  c = {
    name = "Python",
    -- Switch virtual environment
    e = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
    -- Testing
    m = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" },
    c = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
    s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
    -- Dap
    M = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" },
    C = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" },
  },
}

which_key.register(mappings, opts)

-- DAP mappings
-- lvim.builtin.which_key.mappings["dm"] =
--   { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Python Method DAP" }
-- lvim.builtin.which_key.mappings["dc"] = {
--   "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
--   "Test Python Class DAP",
-- }
