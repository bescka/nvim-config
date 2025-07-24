return {
  name = "make build",
  builder = function()
    return {
      name = "Make Build",
      cmd = { "make" },
      args = {},
      cwd = vim.fn.getcwd(),
      components = {
        { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        "default",
      },
    }
  end,
  condition = {
    callback = function()
      return vim.fn.filereadable("Makefile") == 1 or vim.fn.filereadable("makefile") == 1
    end,
  },
}