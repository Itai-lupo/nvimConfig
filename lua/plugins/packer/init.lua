vim.cmd("packadd packer.nvim")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

local packer = require("packer")

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	profile = {
		enable = true,
		threshold = 1,
	},
})

local plugins = {
	{ "wbthomason/packer.nvim" },
	{ "nvim-lua/plenary.nvim", module = "plenary" },

	require("plugins.lsp"),
	require("plugins.null_ls"),
	require("plugins.markdown"),
	require("plugins.pairs"),
	require("plugins.telescope"),
	require("plugins.undotree"),
	require("plugins.git"),
	require("plugins.commentUtil"),
	require("plugins.treesitter"),
	require("plugins.nvim_tree"),
	require("plugins.lualine"),
	require("plugins.indent_color"),
	require("plugins.rainbow_delimters"),
	require("plugins.scroll_bar"),
	require("plugins.nightfly_theme"),
	require("plugins.tmux"),
	require("plugins.maximizer"),
	require("plugins.cheatsheet"),
	require("plugins.refactoring"),
	require("plugins.surround"),
	require("plugins.replace_register"),
	require("plugins.tag_bar"),
}

packer.startup(function(use)
	for _, plugin in ipairs(plugins) do
		use(plugin)
	end
end)
