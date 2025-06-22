vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "ToggleMyPrompt",
  callback = function() require("avante.config").override({system_prompt = "MY CUSTOM SYSTEM PROMPT"}) end,
})

-- full buffer for help
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("help_window_full", { clear = true }),
  pattern = "*.txt",
  callback = function()
    if vim.o.filetype == 'help' then
      vim.cmd.only()
    end
  end
})


vim.api.nvim_create_user_command('PrintSessionName', function()
    local possession = require('possession.session')
    local current_session = possession.session_name()
    if current_session then
        print('Current session: ' .. current_session)
    else
        print('No session is currently loaded.')
    end
end, {})

local terminals = {}  -- Table to store terminals for each directory


function _G.open_project_terminal()
  local current_dir = vim.fn.getcwd()
  
  if not terminals[current_dir] then
    -- Create a new terminal for the current directory
    local Terminal = require('toggleterm.terminal').Terminal
    terminals[current_dir] = Terminal:new({
      dir = current_dir,
      hidden = true,  -- Do not show the terminal upon creation
    })
  end

  -- Toggle the terminal for the current directory
  terminals[current_dir]:toggle()
end

vim.keymap.set('n', '<C-\\>', ':lua open_project_terminal()<CR>', { noremap = true, silent = true })

-- Terminal-specific settings
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
  end,
})

