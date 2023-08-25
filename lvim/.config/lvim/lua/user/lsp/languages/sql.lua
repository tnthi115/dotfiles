-- Make sure to run the following:
-- :MasonInstall sqlls

------------------------
-- Treesitter
------------------------
vim.list_extend(lvim.builtin.treesitter.ensure_installed, {
  "sql",
})

------------------------
-- Plugins
------------------------
-- https://alpha2phi.medium.com/neovim-for-beginners-database-explorer-7db3d3910876
-- ^ Need medium account unfortunately

-- table.insert(lvim.plugins, {
--   -- "tpope/vim-dadbod",
--   ft = { "sql" },
--   cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
--   dependencies = {
--     "kristijanhusak/vim-dadbod-ui",
--     "kristijanhusak/vim-dadbod-completion",
--   },
--   config = function()
--     require("config.dadbod").setup()

--     local function db_completion()
--       require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
--     end

--     vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"

--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = {
--         "sql",
--       },
--       command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
--     })

--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = {
--         "sql",
--         "mysql",
--         "plsql",
--       },
--       callback = function()
--         vim.schedule(db_completion)
--       end,
--     })
--   end,
-- })
