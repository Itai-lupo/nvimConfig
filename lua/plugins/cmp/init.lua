local M = {
	"hrsh7th/nvim-cmp",
	config = function()
		require("plugins.cmp.config")
	end,
	dependencies = {
		{ "onsails/lspkind.nvim" }, -- vs-code like icons for autocompletion

		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "hrsh7th/cmp-nvim-lua" },

		{ "L3MON4D3/LuaSnip" },
		{ "hrsh7th/cmp-nvim-lsp" },

		{ "jose-elias-alvarez/typescript.nvim" }, -- additional functionality for typescript server (e.g. rename file & update imports)
	},

	event = "InsertEnter",
}

return M
