local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
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
  c = {
    name = "Markdown",
    m = { "<cmd>MarkdownPreviewToggle<CR>", "Preview in browser" },
    c = { ":setlocal <C-R>=&conceallevel ? 'conceallevel=0' : 'conceallevel=1'<CR><CR>", "Toggle conceallevel" },
  },
}

which_key.register(mappings, opts)

-- Lazy load linter and formatter
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "markdownlint", filetypes = { "markdown" } },
-- }

-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "markdownlint", filetypes = { "markdown" } },
-- }

-- vim.cmd [[setlocal conceallevel=1]]
