table.insert(lvim.plugins, {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = "User FileOpened",
  dependencies = "nvim-treesitter/nvim-treesitter",
  -- config = function()
  --   require "user.treesitter-textobjects"
  -- end,
})

-- require("nvim-treesitter.configs").setup {
lvim.builtin.treesitter.textobjects = {
  swap = {
    enable = false,
    swap_next = {
      ["<leader>a"] = "@parameter.inner",
    },
    swap_previous = {
      ["<leader>A"] = "@parameter.inner",
    },
  },
  select = {
    enable = true,

    -- automatically jump forward to textobj, similar to targets.vim
    lookahead = true,

    keymaps = {
      -- you can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      -- you can optionally set descriptions to the mappings (used in the desc parameter of
      -- nvim_buf_set_keymap) which plugins like which-key display
      ["ic"] = { query = "@class.inner", desc = "select inner part of a class region" },
      -- you can also use captures from other query groups like `locals.scm`
      ["as"] = { query = "@scope", query_group = "locals", desc = "select language scope" },
    },
    -- you can choose the select mode (default is charwise 'v')
    --
    -- can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * method: eg 'v' or 'o'
    -- and should return the mode ('v', 'v', or '<c-v>') or a table
    -- mapping query_strings to modes.
    selection_modes = {
      ["@parameter.outer"] = "v", -- charwise
      ["@function.outer"] = "v", -- linewise
      ["@class.outer"] = "<c-v>", -- blockwise
    },
    -- if you set this to `true` (default is `false`) then any textobject is
    -- extended to include preceding or succeeding whitespace. succeeding
    -- whitespace has priority in order to act similarly to eg the built-in
    -- `ap`.
    --
    -- can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * selection_mode: eg 'v'
    -- and should return true of false
    include_surrounding_whitespace = true,
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]]"] = { query = "@class.outer", desc = "next class start" },
      --
      -- you can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
      ["]o"] = "@loop.*",
      -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
      --
      -- you can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
      -- below example nvim-treesitter's `locals.scm` and `folds.scm`. they also provide highlights.scm and indent.scm.
      ["]s"] = { query = "@scope", query_group = "locals", desc = "next scope" },
      ["]z"] = { query = "@fold", query_group = "folds", desc = "next fold" },
    },
    goto_next_end = {
      ["]m"] = "@function.outer",
      ["]["] = "@class.outer",
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer",
    },
    goto_previous_end = {
      ["[m"] = "@function.outer",
      ["[]"] = "@class.outer",
    },
    -- below will go to either the start or the end, whichever is closer.
    -- use if you want more granular movements
    -- make it even more gradual by adding multiple queries and regex.
    goto_next = {
      ["]d"] = "@conditional.outer",
    },
    goto_previous = {
      ["[d"] = "@conditional.outer",
    },
  },
}
