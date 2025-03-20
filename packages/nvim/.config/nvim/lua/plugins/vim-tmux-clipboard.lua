return {
  "roxma/vim-tmux-clipboard",
  lazy = false,
  config = function()
    vim.cmd([[ let g:vim_tmux_clipboard#loadb_option = "-w" ]])
  end,
}
