--     ____  __.                                        
--    |    |/ _|____ ___.__. _____ _____  ______  ______
--    |      <_/ __ <   |  |/     \\__  \ \____ \/  ___/
--    |    |  \  ___/\___  |  Y Y  \/ __ \|  |_> >___ \ 
--    |____|__ \___  > ____|__|_|  (____  /   __/____  >
--            \/   \/\/          \/     \/|__|       \/ 
--
--    Author: Alexandru Constantin © 2025
--
--    This file contains the neovim keybindings used by the author.
--    The owner of this config is not held responsible for supporting other setups.
--    If you wish to use this yourself, change it to your specifications yourself.

local set = require "helpers.mapping".set


-- For reloading configs
set("n", "<leader>lf", "<cmd>source %<CR>", "Execute current file")
set("n", "<leader>lc", ":.lua<CR>", "Execute current line")
set("v", "<leader>lc", ":lua<CR>", "Execute current selection")

-- Open explorer
set("n", "<C-b>", ":Ex<CR>", "Open VIM explorer")

-- Navigation
set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")

-- Indent
set("v", "<", "<gv^")
set("v", ">", ">gv^")

-- Buffer navigation
set("n", "<A-l>", ":bnext<CR>", "Go to next buffer")
set("n", "<A-h>", ":bprevious<CR>", "Go to previous buffer")

-- Buffer resizing
set("n", "<leader>h", ":vertical resize -2<CR>")
set("n", "<leader>j", ":resize +2<CR>")
set("n", "<leader>k", ":resize -2<CR>")
set("n", "<leader>l", ":vertical resize +2<CR>")

-- Text shifting
set("v", "<A-k>", ":m '>+1<CR>gv=gv")
set("v", "<A-j>", ":m '<-2<CR>gv=gv")

set("x", "<A-k>", ":m '<-2<CR>gv=gv")
set("x", "<A-j>", ":m '>+1<CR>gv=gv")

