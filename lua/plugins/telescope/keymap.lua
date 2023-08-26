local M = {
	n = {
		["<leader>ff"] = {
			"<cmd>Telescope find_files<cr>",
			"find files within current working directory, respects .gitignore",
		},
		["<leader>fs"] = {
			"<cmd>Telescope live_grep<cr>",
			"find string in current working directory as you type",
		},
		["<leader>fc"] = {
			"<cmd>Telescope grep_string<cr>",
			"find string under cursor in current working directory",
		},
		["<leader>fb"] = {
			"<cmd>Telescope buffers<cr>",
			"list open buffers in current neovim instance",
		},
		["<leader>fh"] = {
			"<cmd>Telescope help_tags<cr>",
			"list available help tags",
		},

		-- telescope git commands
		["<leader>gc"] = {
			"<cmd>Telescope git_commits<cr>",
			"list all git commits (use <cr> to checkout) ['gc' for git commits]",
		},
		["<leader>gfc"] = {
			"<cmd>Telescope git_bcommits<cr>",
			"list git commits for current file/buffer (use <cr> to checkout) ['gfc' for git file commits]",
		},
		["<leader>gb"] = {
			"<cmd>Telescope git_branches<cr>",
			"list git branches (use <cr> to checkout) ['gb' for git branch]",
		},
		["<leader>gs"] = {
			"<cmd>Telescope git_status<cr>",
			"list current changes per file with diff preview ['gs' for git status]",
		},
		["<leader>ft"] = {
			"<cmd>Telescope filetypes<cr>",
			"",
		},
		["<leader>lo"] = {
			"<cmd>Telescope treesitter<cr>",
			"",
		},
		["<leader>m"] = {
			"<cmd>Telescope keymaps<cr>",
			"show all keymaps",
		},
	},
}

return M
