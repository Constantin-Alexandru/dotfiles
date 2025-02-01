return {
  {
    "jhofscheier/ltex-utils.nvim",
    opts = {}
  },
  {
    "lervag/vimtex",
    config = function()
      require "helpers.os".install_from_command(
        { "sudo", "pacman", "--noconfirm", "-Syu", "texlive" }, "latexmk")

      vim.g.vimtex_view_method = "zathura"
    end
  }
}
