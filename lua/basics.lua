local g = vim.g
local set = vim.opt

g.loaded_perl_provider = 1
g.loaded_python_provier = 0
g.loaded_python3_provider = 0
g.python_host_prog = '/usr/bin/python'
g.python3_host_prog = '/opt/homebrew/bin/python3'
g.python_host_skip_check = 1
g.python3_host_skip_check = 1

set.shell = "/bin/zsh"
set.pyxversion = 3
set.ttyfast = true
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'
set.fileencodings = 'utf-8'
set.bomb = false
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.autoindent = true
set.smartindent = true
set.cursorline = false
set.number = true
set.numberwidth = 4
set.backup = false
set.writebackup = false
set.swapfile = false
set.history = 1000
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.splitbelow = true
set.splitright = true
set.wrap = true
set.errorbells = false
set.clipboard = "unnamedplus"
set.conceallevel = 0
set.updatetime = 300
set.undofile = true
set.undodir = '/tmp'
set.hidden = true
set.showcmd = true
set.scrolloff = 8
set.sidescrolloff = 8
set.guicursor = ''
set.fillchars.eob = " "
set.shortmess:append "c"
set.whichwrap:append("b,s,<,>,[,],h,l")
set.iskeyword:append("-")
set.lazyredraw = true
set.wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip"
set.wildignore = set.wildignore + "**/node_modules/**,**/bower_modules/**,__pycache__,*~,*.DS_Store"
set.wildignore = set.wildignore + "**/undo/**,*[Cc]ache/"
set.ruler = false
set.numberwidth = 4
set.signcolumn = "yes"
set.mouse = ""
set.guicursor = ''
set.fillchars.eob = " "
set.showtabline = 0

