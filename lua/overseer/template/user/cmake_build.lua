return {
  name = "cmake build",
  builder = function()
    return {
      name = "CMake Build",
      cmd = { "cmake" },
      args = { "--build", "build", "--config", "Debug" },
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
      return vim.fn.filereadable("CMakeLists.txt") == 1
    end,
  },
}