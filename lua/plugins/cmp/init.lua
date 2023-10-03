local M = {
	"hrsh7th/nvim-cmp",
	config = function()
		require("plugins.cmp.config")
	end,
	requires = {
		{ "onsails/lspkind.nvim" }, -- vs-code like icons for autocompletion

		{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
		{ "hrsh7th/cmp-path", after = "nvim-cmp" },
		{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
		{ "rafamadriz/friendly-snippets", after = "nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },

		{ "L3MON4D3/LuaSnip" },
		{ "hrsh7th/cmp-nvim-lsp" },

		{ "jose-elias-alvarez/typescript.nvim" }, -- additional functionality for typescript server (e.g. rename file & update imports)
	},

	event = "InsertEnter",
}

return M
