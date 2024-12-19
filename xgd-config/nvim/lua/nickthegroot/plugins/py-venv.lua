return {
  'linux-cultist/venv-selector.nvim',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim' },
  branch = 'regexp',
  opts = {},
  cmd = 'VenvSelect',
  keys = {
    { '<leader>vs', '<cmd>VenvSelect<cr>', desc = '[V]env [S]elect' },
  },
}
