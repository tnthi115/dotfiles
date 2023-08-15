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
    name = "Python",
    -- Switch virtual environment
    e = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
    -- Testing
    m = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" },
    c = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
    s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
  },
}

which_key.register(mappings, opts)

-- DAP mappings
lvim.builtin.which_key.mappings["dm"] =
  { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" }
lvim.builtin.which_key.mappings["dc"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
  "Test Class DAP",
}
