------------------------
-- Treesitter
------------------------
vim.list_extend(lvim.builtin.treesitter.ensure_installed, {
  "markdown",
})

vim.list_extend(lvim.lsp.installer.setup.ensure_installed, { "marksman" })

------------------------
-- Linting
------------------------
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { command = "markdownlint", filetypes = { "markdown" } }

------------------------
-- Formatting
------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { command = "markdownlint", filetypes = { "markdown" } }

-- require'lspconfig'.marksman.setup{}
local options = {}
require("lvim.lsp.manager").setup("marksman", options)
