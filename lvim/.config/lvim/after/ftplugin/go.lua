-- Make sure to run the following:
-- :MasonInstall gopls golangci-lint golangci-lint-langserver gofumpt goimports-reviser gomodifytags gotests impl iferr delve golines
-- Install golangci-lint: https://golangci-lint.run/usage/install/
-- ^ Now in mason

-- ------------------------
-- -- Treesitter
-- ------------------------
-- vim.list_extend(lvim.builtin.treesitter.ensure_installed, {
--   "go",
--   "gomod",
-- })

-- ------------------------
-- -- Plugins
-- ------------------------
-- table.insert(lvim.plugins, {
--   "olexsmir/gopher.nvim",
--   ft = { "go", "gomod" },
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-treesitter/nvim-treesitter",
--   },
--   -- build = function()
--   --   vim.cmd [[silent! GoInstallDeps]]
--   -- end,
-- })
-- table.insert(lvim.plugins, {
--   "leoluz/nvim-dap-go",
--   ft = "go",
-- })

------------------------
-- Formatting
------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- goimports not needed, gofumpt is a super set or gopls handles missing imports?
  -- https://www.phind.com/search?cache=8152b2a2-73ab-41f2-8506-33ae3a33d3d7
  -- { command = "goimports", filetypes = { "go" } },
  { command = "gofumpt", filetypes = { "go" } },
  -- { command = "goimports-reviser", filetypes = { "go" } },
  {
    command = "goimports-reviser",
    filetypes = { "go" },
    extra_args = { "-company-prefixes=gopkg.volterra.us", "-set-alias", "-use-cache" },
  },
  -- { command = "golines", filetypes = { "go" }, extra_args = { "-m", "140" } },
}

------------------------
-- Linting
----------------------
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   {
--     command = "golangci-lint",
--     filetypes = { "go", "gomod" },
--     -- extra_args = { "-E=gosec,unparam" },
--     -- extra_args = { "--enable-all" },
--     extra_args = {
--       "--enable-all",
--       "--disable",
--       "deadcode,lll,wsl",
--       "--out-format",
--       "json",
--       "--issues-exit-code=1",
--     },
--   },
-- }

-- lvim.format_on_save = {
--   pattern = { "*.go" },
-- }

------------------------
-- Dap
------------------------
-- local dap = require "dap"
-- dap.adapters.go = {
--   type = "executable",
--   command = "node",
--   args = { vim.fn.stdpath "data" .. "/mason/bin/go-debug-adapter" },
-- }
-- dap.configurations.go = {
--   {
--     type = "go",
--     name = "Debug",
--     request = "launch",
--     showLog = false,
--     program = "${file}",
--     dlvToolPath = vim.fn.exepath "dlv", -- Adjust to where delve is installed
--   },
-- }
local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
  return
end

dapgo.setup()
require("gopher.dap").setup()

------------------------
-- LSP
------------------------
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })

-- local lsp_manager = require "lvim.lsp.manager"
-- lsp_manager.setup("golangci_lint_ls", {
--   -- cmd = "golangci_lint_langserver",
--   on_init = require("lvim.lsp").common_on_init,
--   capabilities = require("lvim.lsp").common_capabilities(),
--   init_options = {
--     command = {
--       "golangci-lint",
--       "run",
--       "--enable-all",
--       "--disable",
--       "deadcode,exhaustruct,gci,gofmt,gofumpt,goimports,golint,lll,maligned,misspell,nlreturn,nonamedreturns,nosnakecase,revive,scopelint,structcheck,tagalign,tagliatelle,varcheck,varnamelen,whitespace,wsl",
--       "--out-format",
--       "json",
--       "--issues-exit-code=1",
--     },
--   },
--   -- settings = {
--   --   golangci_lint_ls = {},
--   -- },
-- })

-- lsp_manager.setup("gopls", {
--   on_attach = function(client, bufnr)
--     require("lvim.lsp").common_on_attach(client, bufnr)
--     -- local _, _ = pcall(vim.lsp.codelens.refresh)
--     -- local map = function(mode, lhs, rhs, desc)
--     --   if desc then
--     --     desc = desc
--     --   end

--     --   vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
--     -- end
--     -- -- map("n", "<leader>ci", "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies")
--     -- map("n", "<leader>ct", "<cmd>GoMod tidy<cr>", "Tidy")
--     -- map("n", "<leader>ca", "<cmd>GoTestAdd<Cr>", "Add Test")
--     -- map("n", "<leader>cA", "<cmd>GoTestsAll<Cr>", "Add All Tests")
--     -- map("n", "<leader>cE", "<cmd>GoTestsExp<Cr>", "Add Exported Tests")
--     -- map("n", "<leader>cg", "<cmd>GoGenerate<Cr>", "Go Generate")
--     -- map("n", "<leader>cf", "<cmd>GoGenerate %<Cr>", "Go Generate File")
--     -- map("n", "<leader>cc", "<cmd>GoCmt<Cr>", "Generate Comment")
--     -- map("n", "<leader>ce", "<cmd>GoIfErr<Cr>", "Generate iferr")
--     -- map("n", "<leader>cT", "<cmd>GoTagAdd<Cr>", "Add Tags")
--     -- map("n", "<leader>dT", "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Go Test")
--   end,
--   on_init = require("lvim.lsp").common_on_init,
--   capabilities = require("lvim.lsp").common_capabilities(),
--   settings = {
--     gopls = {
--       completeUnimported = true,
--       usePlaceholders = true,
--       analyses = {
--         unusedparams = true,
--         shadow = true,
--         unusedwrite = true,
--         useany = true,
--         -- nilness = true,
--       },
--       gofumpt = true,
--       codelenses = {
--         generate = true,
--         gc_details = true,
--         test = true,
--         tidy = true,
--       },
--     },
--   },
-- })

local gopher_ok, gopher = pcall(require, "gopher")
if not gopher_ok then
  return
end

gopher.setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "gotests",
    impl = "impl",
    iferr = "iferr",
  },
}

local which_key_ok, which_key = pcall(require, "which-key")
if not which_key_ok then
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
    name = "Go",
    t = { "<cmd>GoMod tidy<cr>", "Tidy" },
    a = { "<cmd>GoTestAdd<Cr>", "Add Test" },
    A = { "<cmd>GoTestsAll<Cr>", "Add All Tests" },
    E = { "<cmd>GoTestsExp<Cr>", "Add Exported Tests" },
    g = { "<cmd>GoGenerate<Cr>", "Go Generate" },
    f = { "<cmd>GoGenerate %<Cr>", "Go Generate File" },
    c = { "<cmd>GoCmt<Cr>", "Generate Comment" },
    e = { "<cmd>GoIfErr<Cr>", "Generate iferr" },
    T = { "<cmd>GoTagAdd<Cr>", "Add Tags" },
    d = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Go Test" },
  },
}

which_key.register(mappings, opts)

-- vim.cmd [[setlocal shiftwidth=4 softtabstop=4 expandtab]]
