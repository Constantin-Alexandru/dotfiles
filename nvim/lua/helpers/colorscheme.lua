local M = {}

M.set_if_available = function(colorscheme)
	local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

	if not ok then 
		vim.notify("Unable to apply colorscheme " .. colorscheme .. ". Make sure it is installed first")
	end

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return M
