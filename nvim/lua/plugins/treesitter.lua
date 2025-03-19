return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "nvim-treesitter.configs".setup({
        ensure_installed = { "vim", "vimdoc", "lua", "c", "cpp", "bash", "yuck", "cmake", "markdown", "scss", "python" },
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      })
    end
  }
}
