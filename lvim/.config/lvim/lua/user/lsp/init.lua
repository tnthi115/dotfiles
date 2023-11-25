-- Generic LSP Settings

-- Comment out when not in use!
-- require "user.lsp.languages.cpp"
require "user.lsp.languages.markdown"
require "user.lsp.languages.go"
require "user.lsp.languages.python"
-- require "user.lsp.languages.java"
require "user.lsp.languages.sql"

lvim.format_on_save.enabled = true
-- lvim.format_on_save = {
--   pattern = { "*.lua", "*.cpp", "*.sh", ".*rc" },
-- }
lvim.lsp.installer.setup.automatic_installation = true

-- ensure installed in mason:
-- "bashls",
-- "beautysh",
-- "clangd",
-- "codespell",
-- "lua_ls",
-- "markdownlint",
-- "marksman",
-- -- "pyright",
-- "shellcheck",
-- "stylua",

lvim.lsp.installer.setup.ensure_installed = {
  -- "lua-language-server",
  "lua_ls",
  -- "stylua",
  -- "marksman",
  -- "clangd",
  -- "pyright",
  -- "markdownlint",
  -- "shellcheck",
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  -- "cpp",
  -- "javascript",
  "json",
  "lua",
  "python",
  -- "typescript",
  -- "tsx",
  -- "css",
  -- "rust",
  -- "java",
  -- "yaml",
}

-- lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- local cmp = require "cmp"

-- Remap suggestion window close to ctrl + a (from ctrl + e)
-- lvim.keys.insert_mode["<C-a>"] = cmp.mapping.abort()

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { command = "goimports", filetypes = { "go" } },
  -- { command = "gofumpt", filetypes = { "go" } },
  -- { command = "beautysh" },
  { command = "shfmt" },
  { command = "markdownlint", filetypes = { "markdown" } },
  { command = "stylua", filetypes = { "lua" } },
  -- { command = "clang-format", filetypes = { "cpp" } },
  -- need to "pip install black"
  -- can install with mason.nvim
  -- { command = "black", filetypes = { "python" } },
  -- { name = "black" },
  -- need to "pip install yapf"
  -- { command = "yapf", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  -- {
  --   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "prettier",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--print-with", "100" },
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "typescript", "typescriptreact" },
  -- },
}

-- set additional linters --
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "commitlint" },
  -- { command = "flake8", filetypes = { "python" } },
  -- { command = "pylint", filetypes = { "python" } },
  -- { command = "cpplint", filetypes = { "cpp" } },
  { command = "markdownlint", filetypes = { "markdown" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    -- filetypes = { "javascript", "python", "shell" },
    filetypes = { "markdown", "html", "xhtml", "gitcommit" },
  },
}

-- set code actions
-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {
--   {
--     name = "proselint",
--   },
-- }
