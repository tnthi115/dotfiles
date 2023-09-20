-- Make sure to run the following:
-- :MasonInstall gopls golangci-lint golangci-lint-langserver gofumpt goimports-reviser gomodifytags gotests impl iferr delve golines
-- Install golangci-lint: https://golangci-lint.run/usage/install/
-- ^ Now in mason

-- TODO: check out https://github.com/ray-x/go.nvim for a more complete 1 plugin package

------------------------
-- Treesitter
------------------------
vim.list_extend(lvim.builtin.treesitter.ensure_installed, {
  "go",
  "gomod",
})

------------------------
-- Plugins
------------------------
table.insert(lvim.plugins, {
  "olexsmir/gopher.nvim",
  ft = { "go", "gomod" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  -- build = function()
  --   vim.cmd [[silent! GoInstallDeps]]
  -- end,
})
table.insert(lvim.plugins, {
  "leoluz/nvim-dap-go",
  ft = "go",
})

-- ------------------------
-- -- Formatting
-- ------------------------
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   -- goimports not needed, gofumpt is a super set or gopls handles missing imports?
--   -- https://www.phind.com/search?cache=8152b2a2-73ab-41f2-8506-33ae3a33d3d7
--   -- { command = "goimports", filetypes = { "go" } },
--   { command = "gofumpt", filetypes = { "go" } },
--   { command = "goimports-reviser", filetypes = { "go" } },
--   -- { command = "golines", filetypes = { "go" } },
-- }

-- -- lvim.format_on_save = {
-- --   pattern = { "*.go" },
-- -- }

-- ------------------------
-- -- Dap
-- ------------------------
-- local dap_ok, dapgo = pcall(require, "dap-go")
-- if not dap_ok then
--   return
-- end

-- dapgo.setup()

------------------------
-- LSP
------------------------
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("golangci_lint_ls", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  init_options = {
    command = {
      "golangci-lint",
      "run",
      "--enable-all",
      "--disable",
      "deadcode,exhaustivestruct,gci,gofmt,gofumpt,goimports,golint,ifshort,interfacer,lll,maligned,misspell,nlreturn,nonamedreturns,nosnakecase,revive,scopelint,structcheck,tagalign,tagliatelle,varcheck,varnamelen,whitespace,wsl",
      "--out-format",
      "json",
      "--issues-exit-code=1",
    },
  },
  -- settings = {
  --   golangci_lint_ls = {},
  -- },
})

lsp_manager.setup("gopls", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    require("inlay-hints").on_attach(client, bufnr)
    -- local _, _ = pcall(vim.lsp.codelens.refresh)
    -- local map = function(mode, lhs, rhs, desc)
    --   if desc then
    --     desc = desc
    --   end

    --   vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
    -- end
    -- -- map("n", "<leader>ci", "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies")
    -- map("n", "<leader>ct", "<cmd>GoMod tidy<cr>", "Tidy")
    -- map("n", "<leader>ca", "<cmd>GoTestAdd<Cr>", "Add Test")
    -- map("n", "<leader>cA", "<cmd>GoTestsAll<Cr>", "Add All Tests")
    -- map("n", "<leader>cE", "<cmd>GoTestsExp<Cr>", "Add Exported Tests")
    -- map("n", "<leader>cg", "<cmd>GoGenerate<Cr>", "Go Generate")
    -- map("n", "<leader>cf", "<cmd>GoGenerate %<Cr>", "Go Generate File")
    -- map("n", "<leader>cc", "<cmd>GoCmt<Cr>", "Generate Comment")
    -- map("n", "<leader>ce", "<cmd>GoIfErr<Cr>", "Generate iferr")
    -- map("n", "<leader>cT", "<cmd>GoTagAdd<Cr>", "Add Tags")
    -- map("n", "<leader>dT", "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Go Test")
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        shadow = true,
        unusedwrite = true,
        useany = true,
        -- nilness = true,
      },
      gofumpt = true,
      codelenses = {
        generate = true,
        gc_details = true,
        test = true,
        tidy = true,
      },
      hints = {
        assignVariableTypes = true,
        parameterNames = true,
      },
    },
  },
})

-- local status_ok, gopher = pcall(require, "gopher")
-- if not status_ok then
--   return
-- end

-- gopher.setup {
--   commands = {
--     go = "go",
--     gomodifytags = "gomodifytags",
--     gotests = "gotests",
--     impl = "impl",
--     iferr = "iferr",
--   },
-- }
