return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    lazy = false,
    opts = {}
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "lukas-reineke/lsp-format.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer" },
        automatic_installation = true,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup(
              require('coq').lsp_ensure_capabilities({
                -- on_attach = my_custom_on_attach,
                on_attach = require("lsp-format").on_attach
              }))
          end
        }
      })
    end
  },
}
