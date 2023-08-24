local M = {}

M.setup = function(whichkey)
  if whichkey then
    local nopts = {
      mode = "n",     -- NORMAL mode
      prefix = "<leader>",
      buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true,  -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true,  -- use `nowait` when creating keymaps
    }
    local vopts = {
      mode = "v",     -- NORMAL mode
      prefix = "<leader>",
      buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true,  -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true,  -- use `nowait` when creating keymaps
    }
    local nmode = {
      ["<space>"] = { "/", "Search" },
      p = {
        name = "Plugins",
        i = { "<cmd>Lazy install<cr>", "Install" },
        s = { "<cmd>Lazy sync<cr>", "Sync" },
        S = { "<cmd>Lazy clear<cr>", "Status" },
        c = { "<cmd>Lazy clean<cr>", "Clean" },
        u = { "<cmd>Lazy update<cr>", "Update" },
        p = { "<cmd>Lazy profile<cr>", "Profile" },
        l = { "<cmd>Lazy log<cr>", "Log" },
        d = { "<cmd>Lazy debug<cr>", "Debug" },
      },

      l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
        w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>Mason<cr>", "Mason Info" },
        j = {
          "<cmd>lua vim.diagnostic.goto_next()<cr>",
          "Next Diagnostic",
        },
        k = {
          "<cmd>lua vim.diagnostic.goto_prev()<cr>",
          "Prev Diagnostic",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
        e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
      },
      s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        l = { "<cmd>Telescope resume<cr>", "Resume last search" },
        p = {
          "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
          "Colorscheme with Preview",
        },
      },
      ["/"] = {
        name = "Comment",

        ["/"] = {
          "<Plug>(comment_toggle_linewise_current)",
          "Comment toggle current line",
        },
        ["n"] = { "<cmd>Neogen<cr>", "Neogen" },
      },
      ["e"] = {
        name = "Explorer",
        ["e"] = { "<cmd>NvimTreeToggle<cr>", "Nvim Tree toggle" },
        ["o"] = { "<cmd>lua require('oil').open()<cr>", "Open parent directory" },
      },

      [","] = {
        name = "Lspsaga",
        n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Next Diagnoses' },
        p = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Prev Diagnoses' },
        f = { '<cmd>Lspsaga finder<cr>', "Lsp finder" },
        o = { '<cmd>Lspsaga outline<cr>', "Lsp outline" },
        s = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
        d = { "<cmd>Lspsaga peek_definition<cr>", "Preview Definition" },
        r = { "<cmd>Lspsaga rename<cr>", "Rename" },
        a = { "<cmd>Lspsaga code_action<cr>", "Saga Code Action" },
        g = { "<cmd>Lspsaga goto_definition<cr>", "Saga go to Definition" },
        R = { "<cmd>Lspsaga project_replace", "Project replace args" },
        c = { "<cmd>Lspsaga show_cursor_diagnostic<cr>", "Cursor diagnostics" }
      },

      ["u"] = { "<cmd>UndotreeToggle<cr>", "Toggle UndotreeToggle" },

      ["t"] = {
        name = "Tree sitter",
        ["j"] = { "<cmd>TSJToggle<cr>", "Toggle Treesitter Join" },
        ["o"] = { "<cmd>SymbolsOutline<cr>", "Toggle SymbolsOutline" },
      },

      ["m"] = {
        name = " Harpoon",
        m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark file" },
        t = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
        a = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
        s = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
        d = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
        f = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
        g = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Goto mark 5" },
        q = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
        w = { "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
        e = { "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
        r = { "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
        n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next file" },
        p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
      },



    }
    local vmode = {
      ["y"] = { "\"+y", "Yank to + Reg" },
      ["/"] = {
        name = "Comment",

        ["/"] = {
          "<Plug>(comment_toggle_linewise_visual)",
          "Comment toggle linewise (visual)",
        },
        ["b"] = {
          name = "Comment Box",
          ["l"] = { "<cmd>'<,'>CBllbox<cr>", "Comment box toggle Left", },
          ["c"] = { "<cmd>'<,'>CBccbox<cr>", "Comment box toggle Center", },
          ["C"] = { "<cmd>'<,'>CBacbox<cr>", "Comment box toggle center2", },
        },
      },
    }

    whichkey.register(
      nmode, nopts
    )
    whichkey.register(
      vmode, vopts
    )
  end
end

return M
