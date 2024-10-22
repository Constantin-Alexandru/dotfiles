return {
	"rcarriga/nvim-notify",
	opts = {
		config = {
			background_colour = "#000000",
		},
	},
	config = function()
		vim.notify = require("notify")

		local map = require("helpers.keymap").map

		map("n", "<leader>nh", 
      "<cmd>Telescope notify<cr>", 
      "Show notification history")
	end,
}
