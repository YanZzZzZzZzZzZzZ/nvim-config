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
        n = { ':Lspsaga diagnostic_jump_next<cr>', 'Next Diagnoses' },
        p = { ':Lspsaga diagnostic_jump_prev<cr>', 'Prev Diagnoses' },
        f = { ':Lspsaga finder<cr>', "Lsp finder" },
        o = { ':Lspsaga outline<cr>', "Lsp outline" },
        s = { ":Lspsaga signature_help<cr>", "Signature Help" },
        d = { ":Lspsaga peek_definition<cr>", "Preview Definition" },
        r = { ":Lspsaga rename<cr>", "Rename" },
        a = { ":Lspsaga code_action<cr>", "Saga Code Action" },
        g = { ":Lspsaga goto_definition<cr>", "Saga go to Definition" },
        R = { ":Lspsaga project_replace", "Project replace args" },
        c = { ":Lspsaga show_cursor_diagnostic<cr>", "Cursor diagnostics" }
      },

      ["u"] = { ":UndotreeToggle<cr>", "Toggle UndotreeToggle" },

      ["m"] = {
        name = " Harpoon",
        m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark file" },
        t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
        a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
        s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
        d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
        f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
        g = { ":lua require('harpoon.ui').nav_file(5)<cr>", "Goto mark 5" },
        q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
        w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
        e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
        r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
        n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next file" },
        p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
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
