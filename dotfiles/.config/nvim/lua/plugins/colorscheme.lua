return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.bg = "#0e0e0e"
        colors.bg_dark = "#0a0a0a"
        colors.bg_float = "#141414"
        colors.bg_popup = "#141414"
        colors.bg_sidebar = "#0c0c0c"
        colors.bg_statusline = "#141414"
        colors.fg = "#d4d0ce"
        colors.red = "#a63d4f"
        colors.red1 = "#c45c6e"
        colors.orange = "#a68a5a"
        colors.green = "#5a7a5a"
        colors.blue = "#4a5a7a"
        colors.purple = "#7a4a6a"
        colors.cyan = "#5a7a7a"
        colors.comment = "#4a4a4a"
        colors.git = { change = "#a68a5a", add = "#5a7a5a", delete = "#a63d4f" }
        colors.gitSigns = { change = "#a68a5a", add = "#5a7a5a", delete = "#a63d4f" }
      end,
      on_highlights = function(hl, c)
        hl.CursorLine = { bg = "#181818" }
        hl.CursorLineNr = { fg = "#a63d4f", bold = true }
        hl.LineNr = { fg = "#333333" }
        hl.Visual = { bg = "#2a1a1e" }
        hl.Search = { bg = "#2a1a1e", fg = "#f0ecea" }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
