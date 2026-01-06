return {
  'stevearc/overseer.nvim',
  cmd = { 'OverseerRun', 'OverseerToggle', 'OverseerOpen' },
  keys = {
    { '<leader>or', '<cmd>OverseerRun<cr>', desc = '[R]un task' },
    { '<leader>ot', '<cmd>OverseerToggle<cr>', desc = '[T]oggle task list' },
    { '<leader>oo', '<cmd>OverseerOpen<cr>', desc = '[O]pen task list' },
    { '<leader>oc', '<cmd>OverseerClose<cr>', desc = '[C]lose task list' },
    { '<leader>ob', '<cmd>OverseerBuild<cr>', desc = '[B]uild current file' },
  },
  opts = {
    templates = {
      'builtin',
      'user.cpp_build',
      'user.cpp_build_release',
      'user.cpp_run',
      'user.cpp_test',
      'user.cmake_build',
      'user.make_build',
    },
    task_list = {
      direction = 'bottom',
      min_height = 25,
      max_height = 25,
      default_detail = 1,
      bindings = {
        ['?'] = 'ShowHelp',
        ['g?'] = 'ShowHelp',
        ['<CR>'] = 'RunAction',
        ['<C-e>'] = 'Edit',
        ['o'] = 'Open',
        ['<C-v>'] = 'OpenVsplit',
        ['<C-s>'] = 'OpenSplit',
        ['<C-f>'] = 'OpenFloat',
        ['<C-q>'] = 'OpenQuickFix',
        ['p'] = 'TogglePreview',
        ['<C-l>'] = 'IncreaseDetail',
        ['<C-h>'] = 'DecreaseDetail',
        ['L'] = 'IncreaseAllDetail',
        ['H'] = 'DecreaseAllDetail',
        ['['] = 'DecreaseWidth',
        [']'] = 'IncreaseWidth',
        ['{'] = 'PrevTask',
        ['}'] = 'NextTask',
        ['<C-k>'] = 'ScrollOutputUp',
        ['<C-j>'] = 'ScrollOutputDown',
        ['q'] = 'Close',
      },
    },
    form = {
      border = 'rounded',
      zindex = 40,
      min_width = 80,
      max_width = 0.9,
      width = nil,
      min_height = 10,
      max_height = 0.9,
      height = nil,
      win_opts = {
        winblend = 0,
      },
    },
    confirm = {
      border = 'rounded',
      zindex = 40,
      min_width = 20,
      width = 0.5,
      max_width = 0.9,
      min_height = 6,
      height = 0.9,
      max_height = 0.9,
      win_opts = {
        winblend = 0,
      },
    },
    task_win = {
      border = 'rounded',
      win_opts = {
        winblend = 0,
      },
    },
  },
  config = function(_, opts)
    local overseer = require('overseer')
    overseer.setup(opts)
    
    -- Templates are automatically loaded from opts.templates above
  end,
}