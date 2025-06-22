return {
        'cyberpunk3',
        enabled = false,
        dir = vim.fn.stdpath('config') .. '\\colors\\',
        config = function()
            vim.cmd('colorscheme cyberpunk3')
        end,
    }
