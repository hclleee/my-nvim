local g = vim.g
local cmd = vim.cmd

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
require('nvim-tree').setup({
  renderer = {
    icons = {
      show = {
        git = false,
      },
    }
  },
})

-- cmd([[
-- augroup AutoOpenNvimTree
--   autocmd!
--   autocmd BufEnter * if isdirectory(expand('<afile>:p')) | NvimTreeOpen | endif
-- augroup END
-- ]])
-- 
