return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {},
	cmd = "Trouble",
	keys = {
		{ "<leader>tx", "<cmd>Trouble toggle<CR>", 
      desc = "Open/close trouble list" },
		{ "<leader>td", "<cmd>Trouble diagnostics toggle<CR>", 
      desc = "Open trouble workspace diagnostics" },
		{ "<leader>tq", "<cmd>Trouble qflist toggle<CR>", 
      desc = "Open trouble quickfix list" },
		{ "<leader>tl", "<cmd>Trouble loclist toggle<CR>", 
      desc = "Open trouble location list" },
		{ "<leader>tt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
	},
}
