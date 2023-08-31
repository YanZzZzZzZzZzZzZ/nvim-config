vim.opt.backup = false
vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.shell = "/bin/zsh"
vim.opt.wrap = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.timeout = true
vim.o.timeoutlen = 300

vim.g.signify_sign_add = "│"
vim.g.signify_sign_delete = "│"
vim.g.signify_sign_change = "│"
vim.g.updatetime = 50

vim.g.context_nvim_no_redraw = 1

vim.o.linebreak = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.relativenumber = true
vim.o.termguicolors = true


vim.opt.autowrite = true      -- Enable auto write
vim.opt.clipboard = "unnamed" -- or "unnamedplus"
vim.opt.completeopt = "menu,menuone,noselect"
-- vim.opt.conceallevel = 3           -- Hide * markup for bold and italic
vim.opt.conceallevel = 0           -- so that `` is visible in markdown files
vim.opt.cmdheight = 0              -- more space in the neovim command line for displaying messages
vim.opt.fileencoding = "utf-8"     -- the encoding written to a file
vim.opt.incsearch = true
vim.opt.hlsearch = true            -- highlight all matches on previous search pattern
vim.opt.confirm = true             -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true          -- Enable highlighting of the current line
vim.opt.expandtab = true           -- Use spaces instead of tabs
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.ignorecase = true          -- Ignore case
vim.opt.inccommand = "nosplit"     -- preview incremental substitute

vim.opt.list = true
vim.opt.listchars = {
  eol = "⤶",
  tab = ">.",
  trail = "~",
  extends = "◀",
  precedes = "▶",
}
------- Fold options
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 49
vim.opt.foldlevelstart = 49
vim.opt.foldenable = true
vim.opt.fillchars:append("stl: ")
vim.opt.fillchars:append("eob: ")
vim.opt.fillchars:append("fold: ")
vim.opt.fillchars:append("foldopen: ")
vim.opt.fillchars:append("foldsep: ")
vim.opt.fillchars:append("foldclose:")
vim.opt.mouse = "nv"
vim.opt.number = true
vim.opt.pumblend = 10     -- Popup blend
vim.opt.pumheight = 10    -- Maximum number of entries in a popup
vim.opt.relativenumber = true
vim.opt.sidescrolloff = 8 -- Columns of context
-- vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,globals,winsize,wijnpos,terminal"
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2    -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2       -- how many spaces a tab counts for
vim.opt.softtabstop = 2
vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.opt.signcolumn = "yes"   -- Always show the signcolumn, otherwise it would shift the text
vim.opt.smartcase = true     -- Don't ignore case with capitals
vim.opt.smartindent = true   -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.opt.spell = false        -- disable by default, enable in ftplugin or autocmd
vim.opt.spelloptions = { "noplainbuffer" }
vim.opt.splitbelow = true    -- Put new windows below current
vim.opt.splitright = true    -- Put new windows right of current
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0      -- Time in milliseconds to wait for a key code sequence to complete
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200               -- Save swap file and trigger CursorHold
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5                -- Minimum window width
vim.opt.wrap = true                    -- Enable line wrap

vim.o.so = 25

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
