local g = vim.g
local set = vim.opt
local cmd = vim.cmd

set.termguicolors = true
cmd("highlight VertSplit guibg=0 guifg=White")

cmd([[
syntax enable
colorscheme everforest
let g:everforest_better_performance = 1
]])

-- g.oceanic_next_terminal_bold = 0
-- cmd([[
-- syntax enable
-- colorscheme OceanicNext
-- ]])
