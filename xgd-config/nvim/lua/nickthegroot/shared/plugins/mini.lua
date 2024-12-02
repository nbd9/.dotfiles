return {
  {
    'echasnovski/mini.ai',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    event = 'BufRead',
    config = function()
      local mini = require 'mini.ai'
      local treesitter_spec = mini.gen_spec.treesitter
      mini.setup {
        n_lines = 500,
        custom_textobjects = {
          F = treesitter_spec { a = '@function.outer', i = '@function.inner' },
          C = treesitter_spec { a = '@class.outer', i = '@class.inner' },
        },
      }
    end,
  },
  {
    'echasnovski/mini.surround',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'echasnovski/mini.statusline',
    event = 'VeryLazy',
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
  {
    'echasnovski/mini.starter',
    event = 'VimEnter',
    opts = {},
  },
  {
    'echasnovski/mini.pairs',
    event = 'InsertEnter',
    opts = {},
  },
}
