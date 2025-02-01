return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = "make"
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      "nvim-telescope/telescope-fzf-native.nvim"
    },
    opts = {},
    config = function()
      require "telescope".load_extension("fzf")

      local set = require "helpers.mapping".set
      local builtin = require "telescope.builtin" -- Allows the calling of the different telescope pickers


      set("n", "<leader>ff", builtin.find_files, "Telescope file finder")
      set("n", "<leader>fg", builtin.live_grep, "Telescope live grep")
      set("n", "<leader>fb", builtin.buffers, "Telescope buffers")
      set("n", "<leader>fh", builtin.help_tags, "Telescope help tags")
    end

  }
}
