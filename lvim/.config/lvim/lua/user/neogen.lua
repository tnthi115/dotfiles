-- for a full list of annotation_conventions, see supported-languages below
-- https://github.com/danymat/neogen#supported-languages

-- for more template configurations, see the language's configuration file in
-- configurations/{lang}.lua
-- https://github.com/danymat/neogen/tree/main/lua/neogen/configurations

require("neogen").setup {
  enabled = true,
  input_after_comment = true,
  snippet_engine = "luasnip",
  languages = {
    lua = {
      template = {
        -- emmylua | ldoc
        annotation_convention = "emmylua",
        -- lunarvim I think uses ldoc, but this plugin doesn't seem to
        -- currently have as good support for it
        -- annotation_convention = "ldoc",
      },
    },
    python = {
      template = {
        -- google_docstrings | nympydoc | reST
        annotation_convention = "reST",
      },
    },
    go = {
      template = {
        annotation_convention = "godoc",
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
