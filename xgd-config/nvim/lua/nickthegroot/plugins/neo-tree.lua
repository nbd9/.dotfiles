-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local function yank_node(filter)
  return function(state)
    local node = state.tree:get_node()
    local result = filter(node)
    vim.fn.setreg('"', result)
    vim.notify('Copied: ' .. result)
  end
end

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['Ya'] = {
            yank_node(function(node)
              return node:get_id()
            end),
            desc = '[Y]ank [a]bsolute path',
          },
          ['Yr'] = {
            yank_node(function(node)
              return vim.fn.fnamemodify(node:get_id(), ':.')
            end),
            desc = '[Y]ank [r]elative path',
          },
          ['Yh'] = {
            yank_node(function(node)
              return vim.fn.fnamemodify(node:get_id(), ':~')
            end),
            desc = '[Y]ank path relative to [h]ome',
          },
          ['Yf'] = {
            yank_node(function(node)
              return node.name
            end),
            desc = '[Y]ank [f]ilename',
          },
          ['Yn'] = {
            yank_node(function(node)
              return vim.fn.fnamemodify(node.name, ':r')
            end),
            desc = '[Y]ank [n]ame without extension',
          },
          ['Ye'] = {
            yank_node(function(node)
              return vim.fn.fnamemodify(node.name, ':e')
            end),
            desc = '[Y]ank [e]xtension',
          },
        },
      },
    },
  },
}
