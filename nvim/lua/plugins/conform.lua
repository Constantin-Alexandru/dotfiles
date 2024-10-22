return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				latex = { "latexindent" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				react = { "prettier" },
				astro = { "astro" },
				markdown = { "markdownlint-cli2" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		require("helpers.keymap").map({ "n", "v" }, "<C-s>", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, "Format file or range (in visual mode)")
	end,
}

