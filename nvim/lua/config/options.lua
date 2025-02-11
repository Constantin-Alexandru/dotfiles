--    ________          __  .__
--    \_____  \ _______/  |_|__| ____   ____   ______
--     /   |   \\____ \   __\  |/  _ \ /    \ /  ___/
--    /    |    \  |_> >  | |  (  <_> )   |  \\___ \
--    \_______  /   __/|__| |__|\____/|___|  /____  >
--            \/|__|                       \/     \/
--
--    Author: Alexandru Constantin © 2025
--
--    This file contains the neovim options config used by the author.
--    The owner of this config is not held responsible for supporting other setups.
--    If you wish to use this yourself, change it to your specifications yourself.

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = {
  nu = true,
  relativenumber = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  wrap = false,
  swapfile = false,
  backup = false,
  undofile = true,
  hlsearch = false,
  incsearch = true,
  termguicolors = true,
  scrolloff = 8,
  signcolumn = "yes",
  updatetime = 50,
  encoding = "utf-8",
  cmdheight = 0
}

for opt, val in pairs(opts) do
  vim.o[opt] = val
end

vim.opt.isfname:append("@-@")

vim.cmd("filetype plugin indent on")
