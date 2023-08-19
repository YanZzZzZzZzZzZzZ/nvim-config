vim.g.coq_settings = {
  auto_start = true,
  keymap = {
    jump_to_mark = "",
    bigger_preview = "",
    pre_select = true
  }
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
}
