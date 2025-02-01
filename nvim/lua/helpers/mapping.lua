--       _____                       .__                
--      /     \ _____  ______ ______ |__| ____    ____  
--     /  \ /  \\__  \ \____ \\____ \|  |/    \  / ___\ 
--    /    Y    \/ __ \|  |_> >  |_> >  |   |  \/ /_/  >
--    \____|__  (____  /   __/|   __/|__|___|  /\___  / 
--            \/     \/|__|   |__|           \//_____/  
--
--    Author: Alexandru Constantin © 2025
--
--    This file contains the neovim keybindings used by the author.
--    The owner of this config is not held responsible for supporting other setups.
--    If you wish to use this yourself, change it to your specifications yourself.

local M = {}

M.set = function(mode, lhs, rhs, description, opts)
  opts = opts or {}
  opts["noremap"] = true
  opts["silent"] = true
  opts["desc"] = description

  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
