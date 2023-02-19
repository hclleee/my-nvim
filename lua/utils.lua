local M = {}

local set_key = vim.keymap.set

function M.map_key(mode, shortcut, command, opt)
  set_key(mode, shortcut, command, opt)
end

function M.unmap_key(mode, shortcut)
  M.map_key(mode, shortcut, "<nop>", { noremap = true, silent = true })
end

function M.nmap_key(shortcut, command, opt)
  M.map_key('n', shortcut, command, opt)
end

function M.imap_key(shortcut, command, opt)
  M.map_key('i', shortcut, command, opt)
end

return M
