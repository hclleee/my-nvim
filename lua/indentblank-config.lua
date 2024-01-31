require('ibl').setup({
  -- buftype_exclude = { "terminal" },
  -- filetype_exclude = { "dashboard", "NvimTree", "packer", "lsp-installer" },
  --  use_treesitter = true,
  -- show_first_indent_level = false,
  -- show_current_context = true,
  exclude = {
    buftypes = { "terminal" },
    filetypes = {
      "dashboard", "NvimTree", "packer", "lsp-installer",
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "man",
      "gitcommit",
      "TelescopePrompt",
      "TelescopeResults",
    },
  },
  indent = {
    char = "|",
  },
  scope = {
    enabled = false,
  },
})
