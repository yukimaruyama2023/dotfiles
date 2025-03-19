-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-l>", function()
  print(vim.fn.expand("%:p"))
end, { noremap = true, silent = true })
