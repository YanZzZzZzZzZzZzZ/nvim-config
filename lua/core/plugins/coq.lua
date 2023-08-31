local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end


vim.g.coq_settings = {
  auto_start = true,
  keymap = {
    jump_to_mark = "",
    bigger_preview = "",
    pre_select = true
  },
  display = {
    preview = {
      -- border = border "Pmenu",
      positions = {
        north = 4,
        south = 2,
        west = nil,
        east = 1
      },
    },
  },
}
return {

  "ms-jpq/coq_nvim",
  branch = "coq",
  dependencies = {
    {
      "ms-jpq/coq.artifacts",
      branch = "artifacts",
    },
    {
      "ms-jpq/coq.thirdparty",
      branch = "3p",
    },
  },

  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
}
