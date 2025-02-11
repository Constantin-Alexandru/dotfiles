return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = "make"
  },
  {
    'barrett-ruth/http-codes.nvim',
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
    config = function()
      require "helpers.mapping".set("n", "<leader>hc", "<cmd>HTTPCodes<CR>", "HTTP Codes")
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      "nvim-telescope/telescope-fzf-native.nvim",
      "xiyaowong/telescope-emoji.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = {},
    config = function()
      require "telescope".load_extension("fzf")
      require "telescope".load_extension("emoji")
      require "telescope".load_extension("file_browser")


      local set = require "helpers.mapping".set
      local builtin = require "telescope.builtin" -- Allows the calling of the different telescope pickers


      set("n", "<leader>ff", builtin.find_files, "Telescope file finder")
      set("n", "<leader>fg", builtin.live_grep, "Telescope live grep")
      set("n", "<leader>fb", builtin.buffers, "Telescope buffers")
      set("n", "<leader>fh", builtin.help_tags, "Telescope help tags")
      set("n", "<leader>fe", ":Telescope emoji<CR>", "Telescope emoji list")
      set("n", "<leader>fb", ":Telescope file_browser<CR>", "Telescope file browser")
    end

  }
}
