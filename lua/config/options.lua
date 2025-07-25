-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable 24-bit RGB color in the terminal
vim.opt.termguicolors = true

-- Tab Settings
-- tabs are spaces
vim.opt.expandtab = true
-- insert two spaces on tab
vim.opt.shiftwidth = 2
-- number of spaces a tab counts for
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- copy indent from current line when starting a new line
-- vim.opt.autoindent = true
-- do smart auto indenting when starting a new line
vim.opt.smartindent = true
-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }


-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
--
-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- -- Suppress deprecation warnings for plugins
-- vim.deprecate = function() end

