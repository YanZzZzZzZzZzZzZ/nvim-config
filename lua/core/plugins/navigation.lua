local leap = {
  "ggandor/leap.nvim",
  keys = {
    { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
    { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
    { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
  },
  config = function(_, opts)
    local leap = require "leap"
    for k, v in pairs(opts) do
      leap.opts[k] = v
    end
    leap.add_default_mappings(true)
    vim.keymap.del({ "x", "o" }, "x")
    vim.keymap.del({ "x", "o" }, "X")
  end,
}

local navigator =
{
  "numToStr/Navigator.nvim",
  config = function()
    require("Navigator").setup({})
    local map = vim.api.nvim_set_keymap
    local default_options = { noremap = true, silent = true }
    -- tmux navigation
    map("n", "<C-h>", "<cmd>lua require('Navigator').left()<CR>", default_options)
    map("n", "<C-k>", "<cmd>lua require('Navigator').up()<CR>", default_options)
    map("n", "<C-l>", "<cmd>lua require('Navigator').right()<CR>", default_options)
    map("n", "<C-j>", "<cmd>lua require('Navigator').down()<CR>", default_options)
  end,
}

local flash = {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    {
      matcher = function(win)
        ---@param diag Diagnostic
        return vim.tbl_map(function(diag)
          return {
            pos = { diag.lnum + 1, diag.col },
            end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
          }
        end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
      end,
      action = function(match, state)
        vim.api.nvim_win_call(match.win, function()
          vim.api.nvim_win_set_cursor(match.win, match.pos)
          vim.diagnostic.open_float()
        end)
        state:restore()
      end,
    },
    search = {
      mode = function(str)
        return "\\<" .. str
      end,
    },
  },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    -- { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    {
      "<c-s>",
      mode = { "c" },
      function() require("flash").toggle() end,
      desc =
      "Toggle Flash Search"
    },
  },
}

-- local filt = {
--   "ggandor/flit.nvim",
--   keys = function()
--     local ret = {}
--     for _, key in ipairs { "f", "F", "t", "T" } do
--       ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
--     end
--     return ret
--   end,
--   opts = { labeled_modes = "nx" },
-- }

return {
  navigator,
  flash,
}
