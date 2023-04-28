-- local status_ok, which_key = pcall(require, "which-key")
-- if not status_ok then
--   return
-- end

-- local opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }

-- local mappings = {
--   M = { "<cmd>!firefox %<CR>", "HTML Preview" },
-- }

-- which_key.register(mappings, opts)
vim.keymap.set("n", "<leader>M", "<cmd>!firefox %<CR>", { desc = "HTML Preview" })
