-- plugins/debug.lua (lazy.nvim-style: direct return table)
-- Enhanced DAP setup with Go/Python kept, C/C++ via codelldb, and VSCode
-- launch.json/tasks.json integration (overseer for pre/post tasks).

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
    'stevearc/overseer.nvim',
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    local vfn = vim.fn

    -- mason + mason-nvim-dap
    require('mason').setup()
    require('mason-nvim-dap').setup({
      automatic_installation = true,
      handlers = {},
      ensure_installed = { 'debugpy', 'codelldb' },
    })

    -- Resolve codelldb path robustly
    local function resolve_codelldb()
      local ok, registry = pcall(require, 'mason-registry')
      if ok and registry.has_package and registry.get_package then
        local has = false
        pcall(function() has = registry.has_package('codelldb') end)
        if has then
          local pkg
          pcall(function() pkg = registry.get_package('codelldb') end)
          if pkg then
            local install_path
            if type(pkg.get_install_path) == 'function' then
              local ok_ip, ip = pcall(function() return pkg:get_install_path() end)
              if ok_ip then install_path = ip end
            end
            if not install_path and type(pkg.install_path) == 'string' then
              install_path = pkg.install_path
            end
            if not install_path then
              install_path = vfn.stdpath('data') .. '/mason/packages/codelldb'
            end
            local adapter_path = install_path .. '/extension/adapter/codelldb'
            if vfn.executable(adapter_path) == 1 or vfn.filereadable(adapter_path) == 1 then
              return adapter_path
            end
          end
        end
      end
      local path = vfn.exepath('codelldb')
      if path ~= '' then return path end
      local guesses = {
        '/usr/bin/codelldb',
        '/usr/local/bin/codelldb',
        vfn.expand('~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb'),
      }
      for _, g in ipairs(guesses) do
        if vfn.executable(g) == 1 or vfn.filereadable(g) == 1 then
          return g
        end
      end
      return 'codelldb'
    end

    -- Adapter: codelldb (server mode)
    dap.adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = resolve_codelldb(),
        args = { '--port', '${port}' },
      },
    }

    -- Manual C/C++ fallback (works without launch.json)
    dap.configurations.cpp = {
      {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vfn.input('Path to executable: ', vfn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp

    -- Load VSCode launch.json
    local vscode = require('dap.ext.vscode')
    vscode.load_launchjs(nil, { codelldb = { 'c', 'cpp', 'rust' } })

    -- Overseer for preLaunchTask/postDebugTask
    require('overseer').setup()
    local function run_task_if_present(task_name, cb)
      if not task_name or task_name == '' then if cb then cb(true) end; return end
      local ok_overseer, overseer = pcall(require, 'overseer')
      if not ok_overseer then if cb then cb(true) end; return end
      local task = overseer.run_template({ name = task_name })
      if not task then
        local tasks = overseer.list_tasks({ name = task_name })
        if #tasks > 0 then task = tasks[1]; task:start() end
      end
      if not task then if cb then cb(true) end; return end
      task:subscribe({
        on_complete = function(_, status) if cb then cb(status == 'success') end end,
      })
    end

    -- DAP UI
    dapui.setup({ icons = { expanded = '▾', collapsed = '▸', current_frame = '*' } })
    dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
    dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
    dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

    -- Virtual text (off by default)
    require('nvim-dap-virtual-text').setup({ enabled = false })

    -- Keymaps
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function() dap.set_breakpoint(vfn.input('Breakpoint condition: ')) end,
      { desc = 'Debug: Set Breakpoint' })
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: Toggle DAP UI' })
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Debug UI: Toggle' })
    vim.keymap.set('n', '<leader>dv', function() require('nvim-dap-virtual-text').toggle() end,
      { desc = 'Debug: Toggle virtual text' })

    -- Start/Continue honoring preLaunchTask
    vim.keymap.set('n', '<F5>', function()
      local sess = dap.session()
      local cfg = sess and sess.config or nil
      if not cfg then
        local ft = vim.bo.filetype
        local configs = dap.configurations[ft] or {}
        cfg = configs[1]
      end
      local pre = cfg and cfg.preLaunchTask or nil
      run_task_if_present(pre, function(ok)
        if ok then dap.continue() else vim.notify('preLaunchTask failed', vim.log.levels.ERROR) end
      end)
    end, { desc = 'Debug: Start/Continue (runs preLaunchTask if present)' })

    -- postDebugTask after session ends
    dap.listeners.after.event_terminated['post_task'] = function()
      local sess = dap.session(); if not sess or not sess.config then return end
      run_task_if_present(sess.config.postDebugTask)
    end

    -- Go & Python extras
    require('dap-go').setup({ delve = { detached = vfn.has('win32') == 0 } })
    -- require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
  end,
}

