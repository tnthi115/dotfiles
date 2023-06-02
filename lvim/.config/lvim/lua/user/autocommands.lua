-- Autocommands (https://neovim.io/doc/user/autocmd.html)

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--   pattern = "zsh",

-- set indentation to 4 spaces for certain files
vim.api.nvim_create_autocmd("FileType", {
  -- pattern = { "python", "java", "xml", "tcl", "markdown", "css", "html", "xhtml" },
  pattern = { "python", "java", "xml", "tcl", "css", "sh", "bash", "zsh" },
  -- pattern = { "java", "xml", "tcl", "markdown", "css" },
  command = "setlocal shiftwidth=4 softtabstop=4 expandtab",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "html", "xhtml" },
  command = "setlocal wrap",
})

vim.api.nvim_create_autocmd("FileType", {
  -- pattern = {"markdown", "html", "xhtml" },
  pattern = { "markdown" },
  command = "setlocal spell",
})

vim.api.nvim_create_autocmd("FileType", {
  -- pattern = { "markdown", "html", "xhtml" },
  pattern = { "markdown" },
  command = "setlocal complete+=kspell",
})

-- Turn off auto comment after hitting 'o' or 'O' in Normal mode.
-- See :help fo-table
vim.api.nvim_create_autocmd("BufEnter", {
  command = "setlocal formatoptions-=o",
})

-- Keymap for xhtml files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.html" },
  callback = function()
    vim.keymap.set("n", "<leader>M", "<cmd>!firefox %<CR>", { desc = "HTML Preview" })
  end,
})
