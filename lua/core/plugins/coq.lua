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
  config = function()
    -- Automatically start coq
    require("coq").setup({})
    vim.g.coq_settings = { auto_start = 'shut-up' }
  end
}
