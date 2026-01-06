return {
  'jbyuki/nabla.nvim',
  lazy = true,
  dependencies = {
    'nvim-neo-tree/neo-tree.nvim', -- Already installed
    'williamboman/mason.nvim', -- Already installed
  },
  keys = {
    {
      '<leader>mp',
      ':lua require("nabla").popup()<CR>',
      desc = 'Nabla PopUp',
    },
    {
      '<leader>mt',
      ':lua require("nabla").toggle_virt()<CR>',
      desc = 'Nabla Toggle Virtual Text',
    },
  },
  config = function()
    -- Enable virtual text rendering for all math expressions automatically
    require('nabla').enable_virt()
  end,
}

