return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")

		-- set keymaps
		local map = require("helpers.keymap").map -- for conciseness

		map("n", "]t", function()
			todo_comments.jump_next()
		end, "Next todo comment")

		map("n", "[t", function()
			todo_comments.jump_prev()
		end, "Previous todo comment")

		-- TODO: customize icons for comments + maybe add custom comments

		todo_comments.setup()
	end,
}

