local M = {}

local function load_keymaps()
  local wk = require("which-key")
  local utils = require("config.functions")
  
  local leader_groups = {
    ["<leader>"] = { name = "Leader" },
    ["<leader>b"] = { name = "[B]uffer" },
    ["<leader>c"] = { name = "[C]ode" },
    ["<leader>d"] = { name = "[D]ocument" },
    ["<leader>f"] = { name = "[F]ind" },
    ["<leader>g"] = { name = "[G]it" },
    ["<leader>l"] = { name = "[L]SP" },
    ["<leader>s"] = { name = "[S]earch" },
    ["<leader>t"] = { name = "[T]oggle" },
    ["<leader>w"] = { name = "[W]indow" },
    ["<leader>a"] = { name = "[A]I Assistants" },
  }
  
  wk.register(leader_groups)
  
  local normal_mappings = {
    -- Basic editor controls
    ["<Esc>"] = { "<cmd>nohlsearch<CR>", "Clear search highlight" },
    
    -- Buffer navigation
    ["<leader>bd"] = { "<cmd>bdelete<CR>", "[D]elete buffer" },
    ["<leader>bn"] = { "<cmd>bnext<CR>", "[N]ext buffer" },
    ["<leader>bp"] = { "<cmd>bprevious<CR>", "[P]revious buffer" },
    ["<leader>bo"] = { utils.delete_other_buffers, "Delete [O]ther buffers" },
    
    -- Code actions
    ["<leader>cf"] = { utils.format_buffer, "[F]ormat code" },
    ["<leader>ca"] = { vim.lsp.buf.code_action, "Code [A]ction" },
    
    -- CodeCompanion
    ["<leader>aa"] = { "<cmd>CodeCompanionActions<CR>", "CodeCompanion [A]ctions" },
    ["<leader>ac"] = { "<cmd>CodeCompanionChat<CR>", "CodeCompanion [C]hat" },
    ["<leader>at"] = { "<cmd>Telescope codecompanion<CR>", "CodeCompanion [T]elescope" },
    
    -- Diagnostics
    ["<leader>dd"] = { utils.toggle_diagnostics, "Toggle [D]iagnostics" },
    ["<leader>de"] = { vim.diagnostic.open_float, "Show diagnostic [E]rror" },
    ["<leader>dq"] = { vim.diagnostic.setloclist, "Send diagnostics to [Q]uickfix" },
    ["[d"] = { vim.diagnostic.goto_prev, "Previous [D]iagnostic" },
    ["]d"] = { vim.diagnostic.goto_next, "Next [D]iagnostic" },
    
    -- LSP
    ["<leader>lr"] = { vim.lsp.buf.rename, "[R]ename symbol" },
    ["<leader>lh"] = { utils.toggle_inlay_hints, "Toggle inlay [H]ints" },
    ["<leader>lj"] = { vim.lsp.buf.definition, "[J]ump to definition" },
    ["<leader>lk"] = { vim.lsp.buf.hover, "Show [K]ind info" },
    ["<leader>la"] = { vim.lsp.buf.code_action, "Code [A]ction" },
    ["<leader>ls"] = { vim.lsp.buf.signature_help, "[S]ignature help" },
    ["<leader>li"] = { vim.lsp.buf.implementation, "[I]mplementation" },
    ["<leader>lt"] = { vim.lsp.buf.type_definition, "[T]ype definition" },
    ["<leader>lr"] = { vim.lsp.buf.references, "[R]eferences" },
    
    -- Window management
    ["<leader>wh"] = { "<C-w><C-h>", "Move to left window" },
    ["<leader>wl"] = { "<C-w><C-l>", "Move to right window" },
    ["<leader>wj"] = { "<C-w><C-j>", "Move to lower window" },
    ["<leader>wk"] = { "<C-w><C-k>", "Move to upper window" },
    ["<leader>we"] = { "<cmd>wincmd =<CR>", "Equalize windows" },
    ["<leader>ws"] = { "<cmd>split<CR>", "Split window horizontally" },
    ["<leader>wv"] = { "<cmd>vsplit<CR>", "Split window vertically" },
    ["<leader>wc"] = { "<cmd>close<CR>", "Close window" },
    ["<leader>wo"] = { "<cmd>only<CR>", "Close other windows" },
    ["<leader>w]"] = { "<cmd>vertical wincmd ]<CR>", "Open tag in vertical split" },
    
    -- Find/Search with Telescope
    ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "[F]ind [F]iles" },
    ["<leader>fb"] = { "<cmd>Telescope buffers<CR>", "[F]ind [B]uffers" },
    ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", "[F]ind by [G]rep" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<CR>", "[F]ind [H]elp" },
    ["<leader>fk"] = { "<cmd>Telescope keymaps<CR>", "[F]ind [K]eymaps" },
    ["<leader>fp"] = { "<cmd>Telescope projects<CR>", "[F]ind [P]rojects" },
    ["<leader>fr"] = { "<cmd>Telescope oldfiles<CR>", "[F]ind [R]ecent files" },
    ["<leader>fs"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "[F]ind in current buffer" },
    ["<leader>fc"] = { "<cmd>Telescope commands<CR>", "[F]ind [C]ommands" },
    
    -- Toggle features
    ["<leader>tz"] = { utils.toggle_zen_mode, "[Z]en mode" },
    ["<leader>tq"] = { utils.toggle_quickfix, "[Q]uickfix" },
    ["<leader>tt"] = { "<cmd>ToggleTerm<CR>", "[T]erminal" },
    
    -- Git
    ["<leader>gs"] = { "<cmd>Git<CR>", "Git [S]tatus" },
    ["<leader>gc"] = { "<cmd>Git commit<CR>", "Git [C]ommit" },
    ["<leader>gp"] = { "<cmd>Git push<CR>", "Git [P]ush" },
    ["<leader>gb"] = { "<cmd>Git blame<CR>", "Git [B]lame" },
    ["<leader>gd"] = { "<cmd>Gvdiffsplit<CR>", "Git [D]iff" },
    
    -- Utilities
    ["<leader>u"] = { utils.open_url, "Open [U]RL under cursor" },
    ["<leader>q"] = { utils.smart_quit, "[Q]uit" },
  }
  
  wk.register(normal_mappings)
  
  local visual_mappings = {
    [">"] = { ">gv", "Indent and keep selection" },
    ["<"] = { "<gv", "Outdent and keep selection" },
    ["<leader>ca"] = { vim.lsp.buf.code_action, "Code [A]ction" },
    ["<leader>cf"] = { utils.format_buffer, "[F]ormat selection" },
    ["ga"] = { "<cmd>CodeCompanionChat Add<CR>", "CodeCompanion Chat Add" },
  }
  
  wk.register(visual_mappings, { mode = "v" })
  
  local terminal_mappings = {
    ["<Esc><Esc>"] = { "<C-\\><C-n>", "Exit terminal mode" },
  }
  
  wk.register(terminal_mappings, { mode = "t" })
end

M.setup = function()
  -- Setup which-key
  require("which-key").setup({
    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = true, suggestions = 20 },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    window = {
      border = "single",
      position = "bottom",
      padding = { 1, 1, 1, 1 },
    },
    layout = {
      height = { min = 3, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "center",
    },
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
    show_help = true,
    triggers = "auto",
    disable_health_check = true,
  })
  
  load_keymaps()
end

return M 