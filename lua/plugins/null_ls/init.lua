local M = {
	-- formatting & linting
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.null_ls.config")
		end,
	}, -- configure formatters & linters
	{
		"jayp0521/mason-null-ls.nvim",
		config = function()
			require("plugins.null_ls.mason")
		end,
	}, -- bridges gap b/w mason & null-ls
}

return M
