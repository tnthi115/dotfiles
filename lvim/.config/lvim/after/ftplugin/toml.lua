vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "taplo" })

local lsp_manager = require "lvim.lsp.manager"

lsp_manager.setup("taplo", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})
