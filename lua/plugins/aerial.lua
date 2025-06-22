return {
  'stevearc/aerial.nvim',
  config = function()
    require('aerial').setup({
    })
    vim.api.nvim_set_keymap('n', "<leader>sl", "<cmd>AerialToggle!<CR>", {desc = "Toggle Aerial"})
  end
}
