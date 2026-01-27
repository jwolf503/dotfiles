vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

--tabs & indents
opt.tabstop = 2 -- 2 spaces for tab
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if mixe case is used, assume case-sensitive

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark" -- colorschemes kept dark
opt.signcolumn = "yes" -- show sign column so text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, eol, or insert mode start position

-- clipboard 
opt.clipboard:append("unnamedplus") -- use system clipboard as default

--split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

