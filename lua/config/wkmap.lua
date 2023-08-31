local M = {}

M.setup = function(caskey)
  local wk = require('caskey.wk')
  if caskey then
    wk.setup({
      ["q"] = {
        act = caskey.cmd("close"),
        desc = "close window",
        when = {
          caskey.ft("Outline"),
          caskey.bt({ "quickfix", "help" }),
          -- that is equivalent to:
          {
            event = "FileType",
            pattern = "Outline",
          },
          {
            event = "BufWinEnter",
            condition = function()
              return vim.tbl_contains({ "quickfix", "help" }, vim.o.buftype)
            end,
          },
        },
      },
      {
        mode = { "n" },
        ["<leader><space>"] = { act = "/", desc = "Search" },
        ["<leader>p"] = {
          name = "Plugins",
          i = { act = "<cmd>Lazy install<cr>", desc = "Install" },
          s = { act = "<cmd>Lazy sync<cr>", desc = "Sync" },
          S = { act = "<cmd>Lazy clear<cr>", desc = "Status" },
          c = { act = "<cmd>Lazy clean<cr>", desc = "Clean" },
          u = { act = "<cmd>Lazy update<cr>", desc = "Update" },
          p = { act = "<cmd>Lazy profile<cr>", desc = "Profile" },
          l = { act = "<cmd>Lazy log<cr>", desc = "Log" },
          d = { act = "<cmd>Lazy debug<cr>", desc = "Debug" },
        },

        ["<leader>l"] = {
          name = "LSP",
          a = { act = "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
          d = { act = "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
          w = { act = "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
          i = { act = "<cmd>LspInfo<cr>", desc = "Info" },
          I = { act = "<cmd>Mason<cr>", desc = "Mason Info" },
          j = { act = "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
          k = { act = "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
          l = { act = "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
          q = { act = "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
          r = { act = "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
          s = { act = "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
          S = {
            act = "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            desc = "Workspace Symbols",
          },
          e = { act = "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix" },
        },
        ["<leader>s"] = {
          name = "Search",
          b = { act = "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
          c = { act = "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
          f = { act = "<cmd>Telescope find_files<cr>", desc = "Find File" },
          h = { act = "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
          H = { act = "<cmd>Telescope highlights<cr>", desc = "Find highlight groups" },
          M = { act = "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
          r = { act = "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
          R = { act = "<cmd>Telescope registers<cr>", desc = "Registers" },
          t = { act = "<cmd>Telescope live_grep<cr>", desc = "Text" },
          k = { act = "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
          C = { act = "<cmd>Telescope commands<cr>", desc = "Commands" },
          l = { act = "<cmd>Telescope resume<cr>", desc = "Resume last search" },
          p = {
            act = "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
            desc = "Colorscheme with Preview",
          },
        },
        ["<leader>/"] = {
          name = "Comment",
          mode = { "n" },

          ["/"] = {
            act = "<Plug>(comment_toggle_linewise_current)",
            desc = "Comment toggle current line",
          },
          ["n"] = { act = "<cmd>Neogen<cr>", desc = "Neogen" },
        },


        ["<leader>e"] = {
          name = "Explorer",
          ["e"] = { act = "<cmd>NvimTreeToggle<cr>", desc = "Nvim Tree toggle" },
          ["o"] = { act = "<cmd>lua require('oil').open()<cr>", desc = "Open parent directory" },
        },

        ["<leader>,"] = {
          name = "Lspsaga",
          n = { act = "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnoses" },
          p = { act = "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev Diagnoses" },
          f = { act = "<cmd>Lspsaga finder<cr>", desc = "Lsp finder" },
          o = { act = "<cmd>Lspsaga outline<cr>", desc = "Lsp outline" },
          s = { act = "<cmd>Lspsaga signature_help<cr>", desc = "Signature Help" },
          d = { act = "<cmd>Lspsaga peek_definition<cr>", desc = "Preview Definition" },
          r = { act = "<cmd>Lspsaga rename<cr>", desc = "Rename" },
          a = { act = "<cmd>Lspsaga code_action<cr>", desc = "Saga Code Action" },
          g = { act = "<cmd>Lspsaga goto_definition<cr>", desc = "Saga go to Definition" },
          R = { act = "<cmd>Lspsaga project_replace", desc = "Project replace args" },
          c = { act = "<cmd>Lspsaga show_cursor_diagnostic<cr>", desc = "Cursor diagnostics" },
        },

        ["<leader>u"] = { act = "<cmd>UndotreeToggle<cr>", desc = "Toggle UndotreeToggle" },

        ["<leader>t"] = {
          name = "Tree sitter",
          ["j"] = { act = "<cmd>TSJToggle<cr>", desc = "Toggle Treesitter Join" },
          ["o"] = { act = "<cmd>SymbolsOutline<cr>", desc = "Toggle SymbolsOutline" },
        },

        ["<leader>m"] = {
          name = " Harpoon",
          m = { act = "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file" },
          t = { act = "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle UI" },
          a = { act = "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Goto mark 1" },
          s = { act = "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Goto mark 2" },
          d = { act = "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Goto mark 3" },
          f = { act = "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Goto mark 4" },
          g = { act = "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "Goto mark 5" },
          q = { act = "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "Goto mark 6" },
          w = { act = "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", desc = "Goto mark 7" },
          e = { act = "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", desc = "Goto mark 8" },
          r = { act = "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", desc = "Goto mark 9" },
          n = { act = "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Next file" },
          p = { act = "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Prev file" },
        },
      },
      {
        mode = "v",
        name = "Visualed",
        ["<leader>y"] = { act = "\"+y", desc = "Yank to + Reg" },
        ["<leader>/"] = {
          name = "Comment",

          ["/"] = { act = "<Plug>(comment_toggle_linewise_visual)", desc = "comment out selected lines" },
          ["b"] = {
            name = "Comment Box",
            ["l"] = { act = "<cmd>'<,'>CBllbox<cr>", desc = "Comment box toggle Left", },
            ["c"] = { act = "<cmd>'<,'>CBccbox<cr>", desc = "Comment box toggle Center", },
            ["C"] = { act = "<cmd>'<,'>CBacbox<cr>", desc ="Comment box toggle center2", },
          },
        },
      },

    })
  end
end

return M
