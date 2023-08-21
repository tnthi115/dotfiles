-- Make sure to run the following:
-- :MasonInstall pyright flake8 black debugpy
-- swap out flake8 for fuff and mypy
-- Install pytest

------------------------
-- Treesitter
------------------------
vim.list_extend(lvim.builtin.treesitter.ensure_installed, {
  "python",
})

------------------------
-- Plugins
------------------------
table.insert(lvim.plugins, {
  "ChristianChiarulli/swenv.nvim",
  ft = "python",
})
table.insert(lvim.plugins, {
  "mfussenegger/nvim-dap-python",
  ft = "python",
})
table.insert(lvim.plugins, {
  "nvim-neotest/neotest-python",
  ft = "python",
  dependencies = "nvim-neotest/neotest",
})

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
  { command = "ruff", filetypes = { "python" }, extra_args = { "--extend-select=W,N,A,C4,SIM,TCH,PL,RUF" } },
  { command = "mypy", filetypes = { "python" }, extra_args = { "--strict" } },
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

-- Mappings in after/ftplugin/python.lua

-- lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" }
-- lvim.builtin.which_key.mappings["dM"] =
--   { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" }
-- lvim.builtin.which_key.mappings["df"] = {
--   "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>",
--   "Test Class",
-- }
-- lvim.builtin.which_key.mappings["dF"] = {
--   "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
--   "Test Class DAP",
-- }
-- lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

-- -- binding for switching
-- lvim.builtin.which_key.mappings["c"] = {
--   name = "Python",
--   e = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
-- }
