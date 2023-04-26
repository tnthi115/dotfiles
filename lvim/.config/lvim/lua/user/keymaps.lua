-- Keymappings [view all the defaults by pressing <leader>Lk]

local map = vim.keymap.set

lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- lvim.keys.normal_mode["<C-h>"] = "<C-W>h"
-- lvim.keys.normal_mode["<C-l>"] = "<C-W>l"

-- <K> ("shift+k") to hover

-- flip window resizing keys
lvim.keys.normal_mode["<C-Up>"] = ":resize -2<CR>"
lvim.keys.normal_mode["<C-Down>"] = ":resize +2<CR>"
lvim.keys.normal_mode["<C-Left>"] = ":vertical resize +2<CR>"
lvim.keys.normal_mode["<C-Right>"] = ":vertical resize -2<CR>"

-- Remap H and L to move between buffers.
lvim.keys.normal_mode["<S-H>"] = "<cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-L>"] = "<cmd>BufferLineCycleNext<CR>"

-- Center cursor when paging up/down and when cycling through search terms.
-- lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
-- lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- nvim-gdb
-- vim.keymap.del("n", "<leader>dd")
lvim.keys.normal_mode["<leader>dG"] = ":GdbStart gdb -q "
-- vim.cmd[[nnoremap <leader>dG :GdbStart gdb -q]]

-- Folding
-- Close current fold when open. Always open next fold.
lvim.keys.normal_mode["zj"] = "zcjjzOzz"
-- Close current fold when open. Always open previous fold.
lvim.keys.normal_mode["zk"] = "zckkzOzz"
-- Close all folds except the current one. [f]ocus the current fold.
lvim.keys.normal_mode["zf"] = "zMzvzz"

-- todo-comments
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords

-- map("n", "]t", function()
--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
-- end, { desc = "Next error/warning todo comment" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
