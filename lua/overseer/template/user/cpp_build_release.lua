return {
  name = "cpp build release",
  builder = function()
    local file = vim.fn.expand("%:p")
    local file_no_ext = vim.fn.expand("%:r")
    
    -- Check for available compilers
    local compiler = "g++"
    if vim.fn.executable("clang++") == 1 then
      compiler = vim.fn.input("Compiler (g++/clang++): ", "g++")
    end
    
    local std_version = vim.fn.input("C++ Standard (17/20/23): ", "17")
    
    return {
      name = "Build C++ Release (" .. compiler .. ")",
      cmd = { compiler },
      args = { 
        "-std=c++" .. std_version,
        "-Wall", 
        "-Wextra", 
        "-Wpedantic",
        "-O2",
        "-DNDEBUG",
        "-o", 
        file_no_ext, 
        file 
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
  },
}