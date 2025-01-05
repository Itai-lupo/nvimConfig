local M = {
	{ "windwp/nvim-autopairs" }, -- autoclose parens, brackets, quotes, etc...
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("plugins.pairs.config")
		end,
	}, -- autoclose tags
}

return M
