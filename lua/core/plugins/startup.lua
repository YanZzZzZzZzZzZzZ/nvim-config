return {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      -- config
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
