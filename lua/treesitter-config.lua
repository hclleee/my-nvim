require('nvim-treesitter.configs').setup({
  ensure_installed = { 
    'go', 'gomod', 'dart',
    'java', 'scala', 'sql',
    'python', 'lua', 'vim',
    'javascript', 'typescript',
    'vue', 'css', 'html',
    'yaml', 'json', 'toml', 'hcl', 'markdown',
  },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = { 'lua', 'dart', 'go' },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
})
