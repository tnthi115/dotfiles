lvim.builtin.which_key.mappings["j"] = {
  name = "CMake",
  -- Clean previous build system first before generating the new one
  G = { "<cmd>CMakeGenerate!<cr>", "CMakeGenerate!" },
  g = { "<cmd>CMakeGenerate build<cr>", "CMakeGenerate build" },
  d = { "<cmd>CMakeGenerate Debug<cr>", "CMakeGenerate Debug" },
  b = { "<cmd>CMakeBuild<cr>", "CMakeBuild" },
  q = { "<cmd>CMakeClose<cr>", "CMakeClose" },
  c = { "<cmd>CMakeClean<cr>", "CMakeClean" },
  s = { "<cmd>CMakeSwitch build<cr>", "CMakeSwitch build" },
  S = { "<cmd>CMakeSwitch Debug<cr>", "CMakeSwitch Debug" },
}
