return {
  {
    {
      "Nexmean/caskey.nvim",
      dependencies = {
        "folke/which-key.nvim", -- optional, only if you want which-key integration
      },
      config = function()
        wk = require("caskey")
        require("config.wkmap").setup(wk)
      end
    },
  },
}
