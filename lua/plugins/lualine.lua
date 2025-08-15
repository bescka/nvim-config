return {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
        },
        sections = {
          lualine_b = {
            {
              'filename',
              path = 1,
              shorting_target = 0,
            }
          },
          lualine_a = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {'progress'},
          lualine_z = {'location'},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {
            {
              'filename',
              path = 1,
              shorting_target = 0,
            }
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  }
