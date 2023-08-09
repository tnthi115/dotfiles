---@diagnostic disable: unused-local

-- Colorscheme

-- This table is actually useless, but I'm keeping it as a list of all the
-- themes I've tried and liked.
local themes = {
  lunar = "lunar",
  gruvbox_material = "gruvbox-material",
  gruvbox = "gruvbox",
  everforest = "everforest",
  gruvbox_baby = "gruvbox-baby",
  tokyonight = "tokyonight",
  catppuccin = "catppuccin",
  tokyodark = "tokyodark",
  moonlight = "moonlight",
  kanagawa = "kanagawa",
  rose_pine = "rose-pine",
}

local setup_funcs = {
  lunar = function()
    local bg_color = "#1a1b26"
    vim.cmd [[au ColorScheme * hi NvimTreeWinSeparator ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi TabLineFill ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi VertSplit ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi FloatBorder ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi NormalFloat ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi WhichKeyFloat ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi WhichKeyFloat ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi TelescopeNormal ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi Folded ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextOk ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextHint ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextInfo ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextWarn ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextError ctermbg=none guibg=bg_color]]
  end,
  gruvbox_material = function()
    local bg_color = "#1d2021"
    vim.g.gruvbox_material_background = "hard" -- hard, medium, soft
    vim.g.gruvbox_material_foreground = "mix" -- material, mix, original
    vim.g.gruvbox_material_visual = "blue background"
    vim.g.gruvbox_material_menu_selection_background = "blue"
    vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
    -- vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_statusline_style = "default"
    vim.g.gruvbox_material_diagnostic_line_highlight = 1
    vim.g.gruvbox_material_diagnostic_text_highlight = 1
    -- vim.cmd([[highlight lualine_x_diagnostics_hint_normal guifg=#32302f guibg=#32302f]])
    -- vim.g.gruvbox_material_diagnostic_text_highlight = 1
    -- vim.api.nvim_set_hl(0, "WhichKeyFloat", { fg = "#1d2021", bg = "#1d2021" })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1d2021" })
    -- lvim.builtin.nvimtree.highlights.NvimTreeEndOfBuffer.guibg = "#1d2021"
    -- lvim.builtin.which_key.setup.window.border = "single" -- none, single, double, shadow
    -- change in /home/user/.local/lunarvim/site/pack/packer/start/gruvbox-material/gruvbox-material.vim
    -- call gruvbox_material#highlight('NormalFloat', s:palette.fg1, s:palette.bg0)
    -- call gruvbox_material#highlight('FloatBorder', s:palette.grey1, s:palette.bg0)
    -- bufferline color adjustment
    -- lvim.builtin.bufferline.highlights = {
    --   background = {
    --     -- gui = "italic",
    --     italic = true,
    --   },
    --   buffer_selected = {
    --     -- gui = "bold",
    --     bold = true,
    --   },
    --   fill = {
    --     bg = "#282828",
    --     -- bg = "#1d2021",
    --   },
    -- }
    -- lvim.builtin.bufferline.highlights.fill.guibg = "#2F343F"
    -- lualine inactive color for gruvbox_material colorscheme
    -- lvim.builtin.bufferline.highlights.fill.guibg = "#32302f"
    -- lvim.builtin.bufferline.highlights.fill.guibg = "#40423D"
    -- lvim.builtin.bufferline.highlights.fill.guibg = "#282828"
    -- Override these highlight groups
    vim.cmd [[au ColorScheme * hi NvimTreeEndOfBuffer ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi FloatBorder ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi NormalFloat ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi WhichKeyFloat ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi WhichKeyFloat ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi Folded ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi TabLineFill ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi VertSplit ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi TelescopeNormal ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextOk ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextHint ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextInfo ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextWarn ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextError ctermbg=none guibg=bg_color]]
  end,
  everforest = function()
    vim.g.everforest_background = "hard"
    vim.g.everforest_diagnostic_virtual_text = "colored"
  end,
  tokyonight = function()
    local bg_color = "#1a1b26"
    -- local green = "##9ece6a"
    -- local yellow = "#e0af68"
    vim.cmd [[au ColorScheme * hi NvimTreeWinSeparator ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi TabLineFill ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi VertSplit ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi FloatBorder ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi NormalFloat ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi WhichKeyFloat ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi WhichKeyFloat ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi TelescopeNormal ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi Folded ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextOk ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextHint ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextInfo ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextWarn ctermbg=none guibg=bg_color]]
    vim.cmd [[au ColorScheme * hi DiagnosticVirtualTextError ctermbg=none guibg=bg_color]]
  end,
  catppuccin = function()
    local mocha = require("catppuccin.palettes").get_palette "mocha"
    local catppuccin = require "catppuccin"
    catppuccin.setup {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {
        -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = function(colors)
        return {
          Folded = { bg = colors.base },
        }
      end,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- special = true,
        -- treesitter = true,
        -- whick_key = true,
        -- illuminate = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    }
    lvim.colorscheme = "catppuccin"
    vim.cmd.colorscheme "catppuccin"
  end,
  rose_pine = function()
    require("rose-pine").setup {
      --- @usage 'auto'|'main'|'moon'|'dawn'
      variant = "auto",
      --- @usage 'main'|'moon'|'dawn'
      dark_variant = "main",
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = true,
      disable_float_background = true,
      disable_italics = false,

      --- @usage string hex value or named color from rosepinetheme.com/palette
      groups = {
        background = "base",
        background_nc = "_experimental_nc",
        panel = "surface",
        panel_nc = "base",
        border = "highlight_med",
        comment = "muted",
        link = "iris",
        punctuation = "subtle",

        error = "love",
        hint = "iris",
        info = "foam",
        warn = "gold",

        headings = {
          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },
        -- or set all headings at once
        -- headings = 'subtle'
      },

      -- change specific vim highlight groups
      -- https://github.com/rose-pine/neovim/wiki/recipes
      -- change specific vim highlight groups
      highlight_groups = {
        colorcolumn = { bg = "rose" },
        whichkeyfloat = { bg = "base" },
        normalfloat = { bg = "base" },
        floatborder = { bg = "base" },
        gitsignsadd = { fg = "foam" },
        -- gitsignschange = { fg = 'gold' },
        gitsignschange = { fg = "pine" },
        gitsignsdelete = { fg = "love" },
        lualine_c_diff_added_normal = { fg = "foam" },
        -- lualine_b_inactive = { guibg = 'surface' },
        -- lualine_c_inactive = { guibg = 'surface' },

        -- blend colours against the "base" background
        -- cursorline = { bg = 'foam', blend = 10 },
        -- statusline = { fg = 'love', bg = 'love', blend = 10 },
      },
    }

    -- set colorscheme after options
    -- vim.cmd('colorscheme rose-pine')
    -- lvim.colorscheme = "rose-pine"

    lvim.builtin.lualine.sections.lualine_c.diff.diff_color.added = "#9ccfd8"
    lvim.builtin.lualine.sections.lualine_c.diff.diff_color.modified = "#f6c177"
    lvim.builtin.lualine.sections.lualine_c.diff.diff_color.deleted = "#eb6f92"

    -- set bufferline fill color
    lvim.builtin.bufferline.highlights = {
      background = {
        -- gui = "italic",
        italic = true,
      },
      buffer_selected = {
        -- gui = "bold",
        bold = true,
      },
      fill = {
        bg = "#2a273f",
      },
    }
    lvim.builtin.bufferline.highlights.fill.guibg = "#2a273f" -- this is for moon

    local bg_color = "#232136"
    vim.cmd [[au colorscheme * hi FloatBorder ctermbg=none guibg=bg_color]]
    vim.cmd [[au colorscheme * hi NormalFloat ctermbg=none guibg=bg_color]]
    vim.cmd [[au colorscheme * hi WhichKeyFloat ctermbg=none guibg=bg_color]]
  end,
}

lvim.transparent_window = true

local theme = themes.lunar
lvim.colorscheme = theme
local setup_func = setup_funcs[theme]
if setup_func then
  setup_func()
end
