return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim"
    }
  },
  {
    "ahmedkhalf/project.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("project_nvim").setup()
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      telescope.setup({
        defaults = {
          path_display = { "smart" }
        },
        extensions = {
          file_browser = {
            hijack_netrw = true
          }
        }
      })

      telescope.load_extension("file_browser")
      telescope.load_extension("projects")

      local map = require("helpers.keymap").map
      
      -- Telescope mappings
      map('n', "<leader>ff", builtin.find_files, "Find files inside the CWD")
      map('n', "<leader>gf", builtin.live_grep, "Grep-search inside the CWD")
      map('n', "<leader>mp", builtin.man_pages, "Search through the man pages")

      -- Telescope file explorer mappings
      map('n', "<C-b>", 
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>", 
        "Open the file explorer")

      local projects = require("telescope").extensions.projects.projects

      -- Project nvim mappings
      map('n', "<C-o>", projects, "Open recent project files")
    end
  }
}
