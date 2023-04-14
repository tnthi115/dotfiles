-- Configure markdown-preview

vim.g.mkdp_browser = "/usr/bin/firefox"
-- vim.g.mkdp_theme = "light"
vim.g.mkdp_auto_close = 0

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "markdown" },
--   callback = function()
--     lvim.builtin.which_key.mappings["m"] = {
--       "<cmd>MarkdownPreviewToggle<CR>", "Markdown Preview"
--     }
--   end,
-- })

-- lvim.builtin.which_key.mappings["m"] = {
--   "<cmd>MarkdownPreviewToggle<CR>", "Markdown Preview"
-- }
