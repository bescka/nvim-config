return {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
        require("config.keys").setup() -- function runs after the plugin has been loaded
          notify = false
    end,
}

