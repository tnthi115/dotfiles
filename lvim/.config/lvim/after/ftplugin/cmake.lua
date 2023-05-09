local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- Set up cmake keymappings

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
    name = "CMake",
    -- Clean previous build system first before generating the new one
    G = { "<cmd>CMakeGenerate!<cr>", "CMakeGenerate!" },
    g = { "<cmd>CMakeGenerate build<cr>", "CMakeGenerate build" },
    d = { "<cmd>CMakeGenerate Debug<cr>", "CMakeGenerate Debug" },
    b = { "<cmd>CMakeBuild<cr>", "CMakeBuild" },
    q = { "<cmd>CMakeClose<cr>", "CMakeClose" },
    c = { "<cmd>CMakeClean<cr>", "CMakeClean" },
    s = { "<cmd>CMakeSwitch build<cr>", "CMakeSwitch build" },
    S = { "<cmd>CMakeSwitch Debug<cr>", "CMakeSwitch Debug" },
  },
}

which_key.register(mappings, opts)
