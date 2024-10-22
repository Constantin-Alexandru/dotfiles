local opts = {
	nu = true,
	relativenumber = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	smartindent = true,
	wrap = false,
	swapfile = false,
	backup = false,
	undofile = true,
	hlsearch = false,
	incsearch = true,
	termguicolors = true,
	scrolloff = 8,
	signcolumn = "yes",
	updatetime = 50,
	encoding = "utf-8",
  termguicolors = true,
}

for opt, val in pairs(opts) do
	vim.o[opt] = val
end

vim.opt.isfname:append("@-@")

vim.cmd("filetype plugin indent on")

require("helpers.colorscheme").set_if_available("colors")
