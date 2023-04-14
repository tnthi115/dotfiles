-- Configure Github Copilot

-- local ok, copilot = pcall(require, "copilot")
-- if not ok then
--   return
-- end
-- copilot.setup {

-- }

table.insert(lvim.plugins, {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    -- require("copilot").setup({})
    require('copilot').setup({
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>"
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          -- doesn't work in tmux
          -- accept = "<S-CR>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        -- Default
        -- yaml = false,
        -- markdown = false,
        -- help = false,
        -- gitcommit = false,
        -- gitrebase = false,
        -- hgcommit = false,
        -- svn = false,
        -- cvs = false,
        -- ["."] = false,

        ["*"] = false, -- disable for all other filetypes and ignore default 'filetypes'
        -- lua = true,
        cpp = true,
        python = true,
      },
      copilot_node_command = 'node', -- Node.js version must be > 16.x
      server_opts_overrides = {},
    })
  end,
})

-- Use Copilot as a cmp source
table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua" },
  config = function ()
    require("copilot_cmp").setup({
      method = "getCompletionsCycling",
      formatters = {
        label = require("copilot_cmp.format").format_label_text,
        insert_text = require("copilot_cmp.format").format_insert_text,
        preview = require("copilot_cmp.format").deindent,
      },
    })
  end
})
