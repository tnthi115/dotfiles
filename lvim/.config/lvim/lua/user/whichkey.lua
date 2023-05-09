-- Which-key

-- Disable some default mappings
lvim.builtin.which_key.mappings["c"] = nil
-- lvim.builtin.which_key.mappings[";"] = nil
lvim.builtin.which_key.mappings["w"] = nil
lvim.builtin.which_key.mappings["q"] = nil
-- lvim.builtin.which_key.mappings["h"] = nil

-- Turn on which-key help for bindings for folds, spelling and others prefixed with z
lvim.builtin.which_key.setup.plugins.presets.z = true

-- Turn on which-key help for C-W.
lvim.builtin.which_key.setup.plugins.presets.windows = true

-- Turn on which-key help for g.
lvim.builtin.which_key.setup.plugins.presets.g = true

-- lvim.builtin.which_key.icons.separator = "->"
-- lvim.builtin.which_key.icons.group = "+"
-- lvim.builtin.which_key.icons = {
--   breadcrumb = lvim.icons.ui.DoubleChevronRight, -- symbol used in the command line area that shows your active key combo
--   separator = "->",
--   group = "+",
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- Add TroubleToggle
-- lvim.builtin.which_key.mappings["E"] = {
--   -- name = "+Trouble",
--   name = "Errors",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- Add diffview open to git submenu
lvim.builtin.which_key.mappings["gv"] = {
  "<cmd>DiffviewOpen<CR>",
  "Open Diffview",
}

-- Diffview close
lvim.builtin.which_key.mappings["gq"] = {
  "<cmd>DiffviewClose<CR>",
  "Close Diffview",
}

-- Markdown Preview
-- TODO: add this to ftplugin/markdown.lua eventually
-- lvim.builtin.which_key.mappings["m"] = {
--   "<cmd>MarkdownPreviewToggle<CR>", "Markdown Preview"
-- }

-- Terminal
lvim.builtin.which_key.mappings["t"] = {
  name = "Terminal",
  t = { "<cmd>ToggleTerm<CR>", "Toggle" },
  f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
  v = { "<cmd>ToggleTerm direction=vertical size=50<CR>", "Vertical" },
  h = { "<cmd>ToggleTerm direction=horizontal<CR>", "Horizontal" },
  T = { "<cmd>ToggleTerm direction=tab<CR>", "Tab" },
}

-- Bufferline
lvim.builtin.which_key.mappings["b,"] = {
  "<cmd>BufferLineMovePrev<CR>",
  "Move Buffer Left",
}
lvim.builtin.which_key.mappings["b."] = {
  "<cmd>BufferLineMoveNext<CR>",
  "Move Buffer Right",
}

-- Colorizer
-- lvim.builtin.which_key.mappings["C"] = {
--   "<cmd>ColorizerToggle<CR>",
--   "Toggle Color",
-- }

-- Show full path of current buffer
lvim.builtin.which_key.mappings["bp"] = {
  "<cmd>echo expand('%:p)')<CR>",
  "Show Buffer Path",
}

-- Fuzzy search in current buffer
lvim.builtin.which_key.mappings["s/"] = {
  "<cmd>Telescope current_buffer_fuzzy_find<CR>",
  "Search current buffer",
}

-- Persistence (sessions)
-- lvim.builtin.which_key.mappings["S"] = {
--   name = "Session",
--   c = { "<cmd>lua require('persistence').load()<CR>", "Restore last session for current dir" },
--   l = { "<cmd>lua require('persistence').load({ last = true })<CR>", "Restore last session" },
--   Q = { "<cmd>lua require('persistence').stop()<CR>", "Quit without saving session" },
-- }

-- Distant
-- lvim.builtin.which_key.mappings["D"] = {
--   name = "+Distant",
--   -- dactions = require("distant.nav.actions"),
--   l = { "<cmd>DistantLaunch cedar.cs.berkeley.edu mode=ssh ssh.user=cs164-aak<CR>", "Launch cs164" },
--   o = { "<cmd>DistantOpen .<CR>", "Open root dir" },
--   e = { "<cmd>lua require('distant.nav.actions').edit()<CR>", "Edit file" },
--   u = { "<cmd>lua require('distant.nav.actions').up()<CR>", "Go up dir" },
--   k = { "<cmd>lua require('distant.nav.actions').mkdir()<CR>", "Mkdir" },
--   n = { "<cmd>lua require('distant.nav.actions').newfile()<CR>", "Create new file" },
--   r = { "<cmd>lua require('distant.nav.actions').rename()<CR>", "Rename file" },
--   d = { "<cmd>lua require('distant.nav.actions').remove()<CR>", "Remove file" },
-- }

-- nvim-gdb
lvim.builtin.which_key.mappings["dB"] = {
  "<cmd>GdbBreakpointToggle<CR>",
  "GDB Breakpoint",
}

-- nvim-dap
-- remap d to D
-- lvim.builtin.which_key.mappings["dd"] = {}
-- lvim.builtin.which_key.mappings["dD"] = {
--   "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect"
-- }

-- Folding
-- lvim.builtin.which_key.mappings["zj"] = {
--   "zcjjzOzz", "Open next fold"
-- }
-- -- Close current fold when open. Always open previous fold.
-- lvim.builtin.which_key.mappings["zk"] = {
--   "zckkzOzz", "Open previous fold"
-- }
-- -- Close all folds except the current one.
-- lvim.builtin.which_key.mappings["zv"] = {
--   "zMzvzz", "Close all folds except current one"
-- }

-- HTML/webpage preview
-- TODO: add this to ftplugin/html.lua and/or ftplugin/xhtml.lua
-- lvim.builtin.which_key.mappings["M"] = {
--   "<cmd>!firefox %<CR>",
--   "HTML Preview",
-- }

-- lvim.builtin.which_key.mappings["o"] = {
--   name = "Options",
--   c = { "<cmd>lua lvim.builtin.cmp.active = false<cr>", "Completion off" },
--   C = { "<cmd>lua lvim.builtin.cmp.active = true<cr>", "Completion on" },
--   -- w = { '<cmd>lua require("user.functions").toggle_option("wrap")<cr>', "Wrap" },
--   -- r = { '<cmd>lua require("user.functions").toggle_option("relativenumber")<cr>', "Relative" },
--   -- l = { '<cmd>lua require("user.functions").toggle_option("cursorline")<cr>', "Cursorline" },
--   -- s = { '<cmd>lua require("user.functions").toggle_option("spell")<cr>', "Spell" },
--   -- t = { '<cmd>lua require("user.functions").toggle_tabline()<cr>', "Tabline" },
-- }

-- Add close Buffer to buffers submenu.
lvim.builtin.which_key.mappings["bc"] = {
  "<cmd>BufferKill<CR>",
  "Close Buffer",
}

-- Refactoring
lvim.builtin.which_key.mappings["r"] = {
  name = "Refactoring",
}
lvim.builtin.which_key.vmappings["r"] = {
  name = "Refactoring",
}

-- local normal_mode_r_opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "r",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }

-- local visual_mode_r_opts = {
--   mode = "v", -- NORMAL mode
--   prefix = "r",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }

-- local status_ok, which_key = pcall(require, "which-key")
-- if not status_ok then
--   return
-- end

-- local normal_mode_r_mappings = {
--   -- Inline variable can also pick up the identifier currently under the cursor without visual mode
--   i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
--   -- Extract block doesn't need visual mode
--   b = { "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract Block" },
--   B = { "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract Block To File" },
-- }

-- local visual_mode_r_mappings = {
--   e = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
--   f = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract Function To File" },
--   v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
--   i = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
-- }

-- which_key.register(normal_mode_r_mappings, normal_mode_r_opts)
-- which_key.register(visual_mode_r_mappings, visual_mode_r_opts)

lvim.builtin.which_key.mappings["s*"] = {
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<CR>",
  "Search Word Under Cursor",
}

-- todo-comments
lvim.builtin.which_key.mappings["sT"] = { "<cmd>TodoTelescope<CR>", "Search Todos" }

-- Utility function for setting local spacing.
function set_spaces()
  vim.ui.input({ prompt = "Number of spaces: " }, function(input)
    vim.cmd(string.format("setlocal shiftwidth=%s softtabstop=%s expandtab", input, input))
  end)
  -- vim.cmd [[redraw]]
end

-- UI/Toggles
lvim.builtin.which_key.mappings["u"] = {
  name = "UI/Toggles",
  f = { "<cmd>LvimToggleFormatOnSave<CR>", "Toggle Format on Save" },
  s = { "<cmd>lua set_spaces()<CR>", "Set spaces" },
  c = { "<cmd>ColorizerToggle<CR>", "Toggle Color" },
  -- Add CellularAutomaton
  a = {
    name = "Cellular Automaton",
    -- r = { "<cmd>CellularAutomaton make_it_rain<CR>", "Make it Rain" },
    -- g = { "<cmd>CellularAutomaton game_of_life<CR>", "Game of Life" },
  },
}
