-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  enabled = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- '3rd/image.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { ';', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
    { '<leader>;', '<Cmd>Neotree toggle<CR>', { desc = 'NeoTree toggle' } },
  },
  opts = {
    window = {
      width = 30,
      mappings = {
        ['\\'] = 'close_window',
        ['/'] = 'noop',
      },
    },
    -- Open on nvim launch
    event_handlers = {
      {
        event = 'VimEnter',
        handler = function()
          vim.cmd('Neotree toggle')
        end,
      },
    },
    -- Custom highlights
    default_component_configs = {
      normal = {
        background = 'NONE',
      },
      normal_nc = {
        background = 'NONE',
      },
      end_of_buffer = {
        background = 'NONE',
      },
      title_bar = {
        background = 'NONE',
        color = '#D3D3D3',
      },
      prompt_title = {
        background = 'NONE',
        color = '#D3D3D3',
      },
    },
    components = {
      normal = {
        bg_color = 'NONE',
      },
    },
  },
}
