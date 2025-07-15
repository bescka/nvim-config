require("config.options")
require("config.lazy")
require("config.autocmd")
require("config.functions")
require("config.luasnip")

-- Disable swapfile, backup, and writebackup (for load incompatibility issues)
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
