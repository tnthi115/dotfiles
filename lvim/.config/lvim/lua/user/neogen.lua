require("neogen").setup {
  enabled = true,
  snippet_engine = "luasnip",
  languages = {
    lua = {
      template = {
        -- for a full list of annotation_conventions, see supported-languages below,
        annotation_convention = "emmylua",
        -- for more template configurations, see the language's
        -- configuration file in configurations/{lang}.lua
      },
    },
    python = {
      template = {
        annotation_convention = "reST",
      },
    },
  },
}

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
  n = {
    name = "Neogen",
  },
}

which_key.register(mappings, opts)
