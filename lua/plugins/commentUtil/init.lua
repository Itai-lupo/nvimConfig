local M = {
	"numToStr/Comment.nvim",
	config = function()
		require("plugins.commentUtil.config")
	end,
    keys = function ()
    return require("plugins.commentUtil.keymap")
    end,
    lazy = true
}

return M
