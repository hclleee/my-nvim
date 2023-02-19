local utils = require('utils')
local map_key = utils.map_key
local unmap_key = utils.unmap_key
local nmap_key = utils.nmap_key
local imap_key = utils.imap_key

unmap_key('', '<F1>')
unmap_key('', '<space>')

nmap_key('<C-h>', '<C-w>h', {})
nmap_key('<C-j>', '<C-w>j', {})
nmap_key('<C-k>', '<C-w>k', {})
nmap_key('<C-l>', '<C-w>l', {})
nmap_key('<C-n>', '<C-a>', {})

nmap_key('nt', '<cmd>NvimTreeToggle<cr>', {})

map_key("n", "ts", "<cmd>Telescope<cr>", {})
map_key("n", "tc", "<cmd>Telescope coc<cr>", {})
nmap_key("td", "<cmd>Telescope coc diagnostics<cr>", {})
nmap_key("gr", "<cmd>Telescope coc references<cr>", {})
nmap_key("gi", "<cmd>Telescope coc implementations<cr>", {})

nmap_key("gd", "<Plug>(coc-definition)", {})
nmap_key("gy", "<Plug>(coc-type-definition)", {})
nmap_key("rn", "<Plug>(coc-rename)", { silent = true })

-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {
  silent = true,
  noremap = true,
  expr = true,
  replace_keycodes = false
}

imap_key(
  "<TAB>",
  'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
  opts
)

imap_key(
  "<S-TAB>",
  [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
  opts
)

imap_key(
  "<cr>",
  [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
  opts
)

imap_key(
  "<c-space>",
  "coc#refresh()",
  {silent = true, expr = true}
)

imap_key(
  "<c-j>",
  "<Plug>(coc-snippets-expand-jump)",
  {}
)

nmap_key("[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
nmap_key("]g", "<Plug>(coc-diagnostic-next)", { silent = true })

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
nmap_key("K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Formatting selected code
map_key("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
map_key("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})


-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})



-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
map_key("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
map_key("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for apply code actions at the cursor position.
map_key("n", "ca", "<Plug>(coc-codeaction-cursor)", opts)
-- Remap keys for apply code actions affect whole buffer.
map_key("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
-- Remap keys for applying codeActions to the current buffer
map_key("n", "ca", "<Plug>(coc-codeaction)", opts)
-- Apply the most preferred quickfix action on the current line.
map_key("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Remap keys for apply refactor code actions.
map_key("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
map_key("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
map_key("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- Run the Code Lens actions on the current line
map_key("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
map_key("x", "if", "<Plug>(coc-funcobj-i)", opts)
map_key("o", "if", "<Plug>(coc-funcobj-i)", opts)
map_key("x", "af", "<Plug>(coc-funcobj-a)", opts)
map_key("o", "af", "<Plug>(coc-funcobj-a)", opts)
map_key("x", "ic", "<Plug>(coc-classobj-i)", opts)
map_key("o", "ic", "<Plug>(coc-classobj-i)", opts)
map_key("x", "ac", "<Plug>(coc-classobj-a)", opts)
map_key("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
map_key("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
map_key("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
map_key("i", "<C-f>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
map_key("i", "<C-b>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
map_key("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
map_key("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
map_key("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
map_key("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})


-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics
map_key("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions
map_key("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands
map_key("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document
map_key("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols
map_key("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item
map_key("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item
map_key("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list
map_key("n", "<space>p", ":<C-u>CocListResume<cr>", opts)
