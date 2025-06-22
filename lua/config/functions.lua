-- Core utility functions

local M = {}

function M.toggle_diagnostics()
  local diagnostics_active = true
  
  return function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
      vim.diagnostic.show()
      print("Diagnostics enabled")
    else
      vim.diagnostic.hide()
      print("Diagnostics disabled")
    end
  end
end

function M.format_buffer()
  vim.lsp.buf.format({
    async = true,
    timeout_ms = 5000,
  })
end

function M.toggle_inlay_hints()
  local bufnr = vim.api.nvim_get_current_buf()
  local current_value = vim.lsp.inlay_hint.is_enabled(bufnr)
  vim.lsp.inlay_hint.enable(bufnr, not current_value)
  print("Inlay hints: " .. (not current_value and "enabled" or "disabled"))
end

function M.toggle_zen_mode()
  local ok, zen_mode = pcall(require, "zen-mode")
  if not ok then
    vim.notify("zen-mode not available", vim.log.levels.WARN)
    return
  end
  
  zen_mode.toggle({
    window = {
      width = 0.85,
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = "0",
        list = false,
      },
    },
    plugins = {
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      twilight = { enabled = true },
    },
  })
end

function M.open_url()
  local url = vim.fn.expand("<cfile>")
  if url:match("^https?://") then
    local cmd
    if vim.fn.has("win32") == 1 then
      cmd = "start " .. url
    elseif vim.fn.has("macunix") == 1 then
      cmd = "open " .. url
    else
      cmd = "xdg-open " .. url
    end
    vim.fn.system(cmd)
    print("Opening URL: " .. url)
  else
    print("No URL found under cursor")
  end
end

function M.delete_other_buffers()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
  end
  print("Deleted all other buffers")
end

function M.toggle_quickfix()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
      break
    end
  end
  
  if qf_exists then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end

function M.smart_quit()
  local buffers = vim.api.nvim_list_bufs()
  local modified = false
  
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "modified") then
      modified = true
      break
    end
  end
  
  if modified then
    vim.ui.select(
      { "Save and quit", "Quit without saving", "Cancel" },
      { prompt = "Unsaved changes. What do you want to do?" },
      function(choice)
        if choice == "Save and quit" then
          vim.cmd("wa")
          vim.cmd("qa")
        elseif choice == "Quit without saving" then
          vim.cmd("qa!")
        end
      end
    )
  else
    vim.cmd("qa")
  end
end

return M 