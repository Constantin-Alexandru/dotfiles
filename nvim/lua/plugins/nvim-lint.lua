return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			react = { "eslint_d" },
			json = { "jsonlint" },
			markdown = { "markdownlint-cli2" },
			c = { "cpplint" },
			cpp = { "cpplint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		require("helpers.keymap").map("n", "<C-s>", function()
			lint.try_lint()
		end, "Trigger linting for current file")
	end,
}

