-- Configure markdown-preview
local status_ok, markdown_preview = pcall(require, "markdown_preview")
if not status_ok then
  return
end

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
