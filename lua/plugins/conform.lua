return { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
      {
        '<leader>j',
        function()
          require('conform').format { async = true, lsp_fallback = true, timeout_ms = 1000 }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      -- Disabled format_on_save as requested
      -- format_on_save = function(bufnr)
      --   -- Enable auto-format for all filetypes except those listed here
      --   local disable_filetypes = {}
      --   return {
      --     timeout_ms = 500,
      --     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      --   }
      -- end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        css = { 'prettier' },
        json = { 'prettier' },
        markdown = { 'prettier' },
        html = { 'prettier' },
        yaml = { 'prettier' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        rust = { 'rustfmt' },
        bash = { 'shfmt' }, 
        sh = { 'shfmt' },
        c = { 'clang_format' },
        cpp = { 'clang_format' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
      formatters = {
        clang_format = {
          prepend_args = { "--style={IndentWidth: 2, UseTab: Never, ColumnLimit: 100, AccessModifierOffset: -2}" },
        },
      },
    },
  }
