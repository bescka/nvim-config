local check_version = function()
  local verstr = string.format('%s.%s.%s', vim.version().major, vim.version().minor, vim.version().patch)
  if not vim.version.cmp then
    vim.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", verstr))
    return
  end

  if vim.version.cmp(vim.version(), { 0, 9, 4 }) >= 0 then
    vim.health.ok(string.format("Neovim version is: '%s'", verstr))
  else
    vim.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", verstr))
  end
end

local check_external_reqs = function()
  -- Basic utils: `git`, `make`, `unzip`
  for _, exe in ipairs { 'git', 'make', 'unzip', 'rg', 'edge' } do
    local is_executable = vim.fn.executable(exe) == 1
    if is_executable then
      vim.health.ok(string.format("Found executable: '%s'", exe))
    else
      vim.health.warn(string.format("Could not find executable: '%s'", exe))
    end
  end

  return true
end


local success, err = pcall(check_version)
if not success then
    vim.health.error('Error checking version: ' .. err)
end

success, err = pcall(check_external_reqs)
if not success then
    vim.health.error('Error checking external requirements: ' .. err)
end



return { check = function()
    vim.health.start 'health checker nvim'

    vim.health.info [[NOTE: Not every warning is a 'must-fix' in `:checkhealth`
    Fix only warnings for plugins and languages you intend to use.
    Mason will give warnings for languages that are not installed.
    You do not need to install, unless you want to use those languages!]]

    local uv = vim.uv or vim.loop
    vim.health.info('System Information: ' .. vim.inspect(uv.os_uname()))

    check_version()
    check_external_reqs()
  end
}

