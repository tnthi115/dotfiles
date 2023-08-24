-- Make sure to run the following:
-- :MasonInstall jdtls google_java_format java-debug-adapter java-test
-- Install Java with brew: brew install java11
-- Install Java with sdkman: https://sdkman.io/
-- https://github.com/sdkman/homebrew-tap

------------------------
-- Treesitter
------------------------
vim.list_extend(lvim.builtin.treesitter.ensure_installed, {
  "java",
})

------------------------
-- Plugins
------------------------
table.insert(lvim.plugins, {
  "mfussenegger/nvim-jdtls",
  -- For whatever reason this plugin needs to be loaded before the LspAttach
  -- event (I think), otherwise jdtls will be loaded with default settings.
  -- event = "User FileOpened",
  event = "LspAttach",
  -- ft = { "java" },
})

------------------------
-- Formatting
------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "google_java_format", filetypes = { "java" } },
}
