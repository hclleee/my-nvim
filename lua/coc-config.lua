local g = vim.g

local utils = require('utils')
local map_key = utils.map_key
local nmap_key = utils.nmap_key
local imap_key = utils.imap_key

g.coc_global_extensions = {
  'coc-css',
  'coc-html',
  'coc-highlight',
  'coc-prettier',
  'coc-eslint',
  'coc-sql',
  'coc-yaml',
  'coc-json',
  'coc-vetur',
  'coc-java',
  'coc-pyright',
  'coc-flutter',
  'coc-tsserver',
  'coc-word',
  'coc-tabnine',
}
