local M = {
	"iamcco/markdown-preview.nvim",
	build  = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		require("plugins.markdown.config")
	end,
}

return M
