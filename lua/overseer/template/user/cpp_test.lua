return {
  name = "cpp test",
  builder = function()
    local file = vim.fn.expand("%:p")
    local file_no_ext = vim.fn.expand("%:p:r")
    local executable = vim.fn.expand("%:t:r")

    -- Check for available compilers
    local compiler = "g++"
    if vim.fn.executable("clang++") == 1 then
      compiler = vim.fn.input("Compiler (g++/clang++): ", "g++")
    end

    local std_version = vim.fn.input("C++ Standard (17/20/23): ", "17")

    return {
      name = "Build & Run C++ Tests (" .. compiler .. ")",
      cmd = { "sh" },
      args = {
        "-c",
        string.format(
          "%s -std=c++%s -Wall -Wextra -g -o %s %s -lgtest -lgtest_main -pthread && ./%s",
          compiler,
          std_version,
          file_no_ext,
          file,
          executable
        )
      },
      cwd = vim.fn.expand("%:p:h"),
      components = {
        { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        "default",
      },
    }
  end,
  condition = {
    filetype = { "cpp" },
    callback = function()
      -- Only show for test files
      return vim.fn.expand("%:t"):match("_test%.cpp$") ~= nil or
             vim.fn.expand("%:t"):match("_tests%.cpp$") ~= nil or
             vim.fn.expand("%:t"):match("test_.*%.cpp$") ~= nil
    end,
  },
}
