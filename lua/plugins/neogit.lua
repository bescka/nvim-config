return {
    'TimUntersberger/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    config = function()
      require('neogit').setup({
        integrations = {
          diffview = true  -- Integrate with diffview.nvim
        }
      })
      vim.keymap.set('n', '<leader>n', vim.cmd.Neogit, { desc = 'neogit'})
      
      -- Quick commit with message prompt
      vim.keymap.set('n', '<leader>gq', function()
        vim.ui.input({ prompt = 'Quick Commit -- Message: ' }, function(input)
          if input and input ~= '' then
            vim.fn.system('git add .')
            vim.fn.system('git commit -m "' .. input .. '"')
          end
        end)
      end, { desc = 'Quick commit' })
      
      -- Quick commit and push
      vim.keymap.set('n', '<leader>gqp', function()
        vim.ui.input({ prompt = 'Commit message: ' }, function(input)
          if input and input ~= '' then
            vim.fn.system('git add .')
            vim.fn.system('git commit -m "' .. input .. '"')
            require('neogit').action('push', 'push_current')()
          end
        end)
      end, { desc = 'Quick commit and push' })
    end
  }
