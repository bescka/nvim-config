return {
  name = "cpp run",
  builder = function()
    local file_no_ext = vim.fn.expand("%:r")
    return {
      name = "Run C++",
      cmd = { "./" .. vim.fn.expand("%:t:r") },
      args = {},
      cwd = vim.fn.expand("%:p:h"),
      components = {
        { "on_output_quickfix", open = true },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}