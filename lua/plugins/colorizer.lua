return {
  'NvChad/nvim-colorizer.lua',
  enabled = false,
  config = function()
    require('colorizer').setup({
      'css',
      'javascript',
      'html',
      'lua'
    }, {
      mode = 'background'
    })
  end
}
