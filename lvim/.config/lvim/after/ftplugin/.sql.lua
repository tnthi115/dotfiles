------------------------
-- Formatting
------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
-- Limited DDL and DML support currently. https://github.com/tconbeer/sqlfmt/issues/262
formatters.setup { { name = "sqlfmt" }, filetypes = { "sql" } }

------------------------
-- Linting
------------------------
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "sqlfluff", filetypes = { "sql" } },
}

------------------------
-- LSP
------------------------
local lsp_manager = require "lvim.lsp.manager"

lsp_manager.setup("sqlls", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})
