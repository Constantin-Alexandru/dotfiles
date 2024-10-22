return {
	{
		"windwp/nvim-ts-autotag",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = {
					enable = true,
				},
				sync_install = false,
				auto_install = true,
				ignore_install = {},
				modules = {},
				indent = { enable = true },
				autotag = {
					enable = true,
				},
				ensure_installed = {
					"lua",
					"latex",
					"html",
					"css",
					"javascript",
					"typescript",
					"json",
					"c",
					"cpp",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})

			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},
}
