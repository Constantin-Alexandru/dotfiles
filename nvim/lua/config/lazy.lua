--    .__                        
--    |  | _____  ___________.__.
--    |  | \__  \ \___   <   |  |
--    |  |__/ __ \_/    / \___  |
--    |____(____  /_____ \/ ____|
--              \/      \/\/     
--
--    Author: Alexandru Constantin © 2025
--
--    This file contains the lazy.nvim setup used by the author.
--    The owner of this config is not held responsible for supporting other setups.
--    If you wish to use this yourself, change it to your specifications yourself.

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = { { import = "plugins" } },
  install = { colorscheme = { "dracula" } },
  checker = { enabled = true },
})
