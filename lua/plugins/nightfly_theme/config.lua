vim.g.nightflyNormalFloat = true
vim.g.nightflyItalics = false
vim.g.nightflyCursorColor = true
vim.g.nightflyTransparent = true
vim.g.nightflyUnderlineMatchParen = true
vim.g.nightflyVirtualTextColor = true
vim.g.nightflyWinSeparator = 0

local palette = require("nightfly").palette

-- set custom theme settings to use
local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "nightfly",
	callback = function()
		vim.api.nvim_set_hl(0, "Function", { fg = "#6f6fef", bold = true })
		vim.api.nvim_set_hl(0, "Comment", { fg = "#efefef", underline = true })
	end,
	group = custom_highlight,
})

vim.cmd("colorscheme nightfly")
