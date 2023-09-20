-- Make sure to run the following:
-- :MasonInstall clangd codelldb cpplint

------------------------
-- Treesitter
------------------------
vim.list_extend(lvim.builtin.treesitter.ensure_installed, {
  -- "c",
  "cpp",
})

------------------------
-- Plugins
------------------------
-- C++ clangd extensions and cmake integration
table.insert(lvim.plugins, {
  "p00f/clangd_extensions.nvim",
  ft = { "c", "cpp" },
})
if vim.fn.executable "cmake" == 1 then
  table.insert(lvim.plugins, {
    "cdelledonne/vim-cmake",
    ft = { "cpp", "cmake" },
    config = function()
      vim.cmd [[let g:cmake_link_compile_commands = 1]]
      vim.cmd [[let g:cmake_default_config = "build"]]
    end,
  })
end
table.insert(lvim.plugins, {
  "sakhnik/nvim-gdb",
  build = ":!./install.sh",
  ft = { "c", "cpp" },
})

-- TODO: move everything under this comment to ftplugin/cpp.lua and test

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

------------------------
-- Linting
------------------------
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "cpplint", filetypes = { "cpp" } },
-- }

------------------------
-- Formatting
------------------------
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "clang-format", filetypes = { "cpp" } },
-- }

-- some settings can only passed as commandline flags, see `clangd --help`
local clangd_flags = {
  "--background-index",
  "--fallback-style=Google",
  "--all-scopes-completion",
  "--clang-tidy",
  "--log=error",
  "--suggest-missing-includes",
  "--cross-file-rename",
  "--completion-style=detailed",
  "--pch-storage=memory", -- could also be disk
  "--folding-ranges",
  "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
  "--offset-encoding=utf-16", --temporary fix for null-ls
  -- "--limit-references=1000",
  -- "--limit-resutls=1000",
  -- "--malloc-trim",
  "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
  -- "--header-insertion=never",
  -- "--query-driver=<list-of-white-listed-complers>"
}

local provider = "clangd"

local custom_on_attach = function(client, bufnr)
  require("lvim.lsp").common_on_attach(client, bufnr)

  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<leader>lh", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
  vim.keymap.set("x", "<leader>lA", "<cmd>ClangdAST<cr>", opts)
  vim.keymap.set("n", "<leader>lH", "<cmd>ClangdTypeHierarchy<cr>", opts)
  vim.keymap.set("n", "<leader>lt", "<cmd>ClangdSymbolInfo<cr>", opts)
  vim.keymap.set("n", "<leader>lm", "<cmd>ClangdMemoryUsage<cr>", opts)

  require("clangd_extensions.inlay_hints").setup_autocmd()
  require("clangd_extensions.inlay_hints").set_inlay_hints()
end

local status_ok, project_config = pcall(require, "rhel.clangd_wrl")
if status_ok then
  clangd_flags = vim.tbl_deep_extend("keep", project_config, clangd_flags)
end

local custom_on_init = function(client, bufnr)
  require("lvim.lsp").common_on_init(client, bufnr)
  require("clangd_extensions.config").setup {}
  require("clangd_extensions.ast").init()
  vim.cmd [[
  command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
  command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
  command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
  command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
  command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
  ]]
end

local opts = {
  cmd = { provider, unpack(clangd_flags) },
  on_attach = custom_on_attach,
  on_init = custom_on_init,
}

require("lvim.lsp.manager").setup("clangd", opts)

-- install codelldb with :MasonInstall codelldb
-- configure nvim-dap (codelldb)
lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      command = "codelldb",
      args = { "--port", "${port}" },

      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        local path
        -- vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
        vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/Debug/" }, function(input)
          path = input
        end)
        vim.cmd [[redraw]]
        return path
      end,
      -- for cs184, executable should be run with cwd = build/
      -- cwd = "${workspaceFolder}",
      cwd = "${workspaceFolder}/Debug",
      stopOnEntry = false,
      -- args = function()
      --   local args
      --   -- vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
      --   vim.ui.input({ prompt = "Args: ", default = "" }, function(input)
      --     for word in input:gmatch("%w+") do table.insert(args, word) end
      --   end)
      --   vim.cmd [[redraw]]
      --   return args
      -- end,
      -- args = function()
      --   local args = { "hello", "hi", }
      --   vim.cmd [[redraw]]
      --   return args
      -- end,
      args = {},
    },
  }

  dap.configurations.c = dap.configurations.cpp
end

-- local last_cmd = ""

-- local debug = function ()
--   -- fills in the last used cmd, use <Ctrl-U> to remove
--   local cmd
--   -- vim.ui.input({ prompt = "DAP launch cmd: " .. vim.loop.cwd() .. "/Debug/", default = last_cmd }, function(input)
--   vim.ui.input({ prompt = "DAP launch cmd: ", default = vim.loop.cwd() .. "/Debug/" }, function(input)
--     cmd = input
--   end)
--   if cmd == "" then return end

--   last_cmd = cmd

--   -- split command in program and list of args
--   local program = nil
--   local args = nil
--   local splits = vim.split(cmd, " ")
--   if #splits > 0 then  -- probably better to exit the function if this fails
--       program = splits[1]
--       if #splits > 1 then
--           table.remove(splits, 1)
--           args = splits
--       end
--   end

--   local config = {
--       name = "Launch File",
--       type = "codelldb",
--       request = "launch",
--       program = program,
--       cwd = '${workspaceFolder}/Debug',
--       stopOnEntry = false,
--       args = args,
--       runInTerminal = false,
--   }
--   local dap = require('dap')
--   dap.run(config)
-- end

-- lvim.builtin.which_key.mappings["dS"] = {

-- }

-- cmake which-key bindings for c++ files
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "cpp" },
--   callback = function()
--     lvim.builtin.which_key.mappings["j"] = {
--       name = "C++",
--       -- Clean previous build system first before generating the new one
--       G = { "<cmd>CMakeGenerate!<cr>", "CMakeGenerate!" },
--       g = { "<cmd>CMakeGenerate build<cr>", "CMakeGenerate build" },
--       d = { "<cmd>CMakeGenerate Debug<cr>", "CMakeGenerate Debug" },
--       b = { "<cmd>CMakeBuild<cr>", "CMakeBuild" },
--       q = { "<cmd>CMakeClose<cr>", "CMakeClose" },
--       c = { "<cmd>CMakeClean<cr>", "CMakeClean" },
--       s = { "<cmd>CMakeSwitch build<cr>", "CMakeSwitch build" },
--       S = { "<cmd>CMakeSwitch Debug<cr>", "CMakeSwitch Debug" },
--     }
--   end,
-- })

-- lvim.builtin.which_key.mappings["j"] = {
--   name = "CMake",
--   -- Clean previous build system first before generating the new one
--   G = { "<cmd>CMakeGenerate!<cr>", "CMakeGenerate!" },
--   g = { "<cmd>CMakeGenerate build<cr>", "CMakeGenerate build" },
--   d = { "<cmd>CMakeGenerate Debug<cr>", "CMakeGenerate Debug" },
--   b = { "<cmd>CMakeBuild<cr>", "CMakeBuild" },
--   q = { "<cmd>CMakeClose<cr>", "CMakeClose" },
--   c = { "<cmd>CMakeClean<cr>", "CMakeClean" },
--   s = { "<cmd>CMakeSwitch build<cr>", "CMakeSwitch build" },
--   S = { "<cmd>CMakeSwitch Debug<cr>", "CMakeSwitch Debug" },
-- }
