local map = require("helpers.keymap").map

-- Save and exit
map("n", "<leader>wa", "<cmd>wa<cr>", "Write all")
map("n", "<leader>wqa", "<cmd>wqa<cr>", "Quit all")

-- Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resizing
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Buffer Navigation
map("n", "<A-Right>", ":bnext<CR>", "Go to next buffer")
map("n", "<A-Left>", ":bprevious<CR>", "Go to previous buffer")

-- Indent
map("v", "<", "<gv^", "Decrease indentation by 1 level")
map("v", ">", ">gv^", "Increase indentation by one level")

-- Text Movement
map("v", "<A-Down>", ":m '>+1<CR>gv=gv")
map("v", "<A-Up>", ":m '<-2<CR>gv=gv")

map("x", "<A-Up>", ":m '<-2<CR>gv=gv")
map("x", "<A-Down>", ":m '>+1<CR>gv=gv")

