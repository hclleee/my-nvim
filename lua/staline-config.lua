require('staline').setup({
  sections = {
    left = {
      '  ',
      'mode',
      ' ',
      'branch',
      ' ',
      'lsp'
    },
    mid = {},
    right = {
      'file_name',
      'line_column'
    },
  },
  mode_colors = {
    n = "#D3C6AA",
    i = "#E67E80",
    c = "#83C092",
    v = "#D699B6",
    V = "#D699B6",
  },
  defaults = {
    true_colors = true,
    line_column = " [%l/%L] :%c  ",
    branch_symbol = " "
  },
  special_table = {
    NvimTree = {'File Explorer', ' '},
    packer = {'Packer', ' '},
    TelescopePrompt = {'Telescope', ' '}
  },
  lsp_symbols = {Error = " ", Info = " ", Warn = " ", Hint = " "}
})
