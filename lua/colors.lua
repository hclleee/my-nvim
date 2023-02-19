local set = vim.opt
local cmd = vim.cmd

local Color, colors, Group, groups, styles = require('colorbuddy').setup()

set.termguicolors = true
cmd("highlight VertSplit guibg=0 guifg=White")

cmd([[
syntax enable
colorscheme everforest
let g:everforest_better_performance = 1
]])

Color.new('floating_fg', '#d3c6aa')
Color.new('floating_bg', '#2d363b')
Group.new('CocFloating', colors.floating_fg, colors.floating_bg, nil)

-- local g = vim.g
-- g.oceanic_next_terminal_bold = 0
-- cmd([[
-- syntax enable
-- colorscheme OceanicNext
-- ]])
