return {
  { "rebelot/kanagawa.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      -- flavour = "mocha", -- choose from "mocha", "macchiato", "frappe", "latte"
      flavour = "macchiato", -- choose from "mocha", "macchiato", "frappe", "latte"
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      -- colorscheme = "tokyonight",
    },
  },
}
