-- Shorter versions of the keymap functions

local M = {}

M.map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, {noremap = true, silent = true, desc = desc})
end

M.set_leader = function(key)
  vim.g.mapleader = key
  vim.g.maplocalleader = key
  M.map({"n", "v"}, key, "<nop>")
end

return M
