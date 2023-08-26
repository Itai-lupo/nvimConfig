local cmd = vim.cmd
local lsp = vim.lsp

local M = {
	n = {
		["<leader>pv"] = { cmd.Ex, "" },
		["C-s"] = { cmd.w, "" },

		["<C-j>"] = { ":m+<CR>==", "" },
		["<C-k>"] = { ":m-2<CR>==", "" },

		["J"] = { "mzJ`z", "" },
		["<C-d>"] = { "<C-d>zz", "" },
		["<C-u>"] = { "<C-u>zz", "" },
		["n"] = { "nzzzv", "" },
		["N"] = { "Nzzzv", "" },

		["<C-f>"] = { "<cmd>silent !tmux neww tmux-sessionizer<CR>", "" },
		["<leader>f"] = { lsp.buf.format, "" },

		["<leader><C-K>"] = { "<cmd>cnext<CR>zz", "" },
		["<leader><C-J>"] = { "<cmd>cprev<CR>zz", "" },
		["<leader>k"] = { "<cmd>lnext<CR>zz", "" },
		["<leader>j"] = { "<cmd>lprev<CR>zz", "" },
		["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "" },
		["<leader>x"] = { "<cmd>!chmod +x %<CR>", { silent = true }, "" },
		["<leader><leader>"] = {
			function()
				cmd("w")
				cmd("so")
			end,
			"",
		},

		["<leader>+"] = { "<C-a>", "" },
		["<leader>-"] = { "<C-x>", "" },

		["<leader>Y"] = { [["+Y]], "" },

		-- window management
		["<leader>sv"] = { "<C-w>v", "split window vertically" },
		["<leader>sh"] = { "<C-w>s", "split window horizontally" },
		["<leader>se"] = { "<C-w>=", "make split windows equal width & height" },
		["<leader>sx"] = { ":close<CR>", "close current split window" },

		["<leader>to"] = { ":tabnew<CR>", "open new tab" },
		["<leader>tx"] = { ":tabclose<CR>", "close current tab" },
		["<leader>tn"] = { ":tabn<CR>", "go to next tab" },
		["<leader>tp"] = { ":tabp<CR>", "go to previous tab" },
	},
	v = {
		["<C-j>"] = { ":m '>+1<CR>gv=gv", "" },
		["<C-k>"] = { ":m '<-2<CR>gv=gv", "" },
	},
	i = {
		["<M-j>"] = { "<Esc>:m+<CR>==gi", "" },
		["<M-k>"] = { "<Esc>:m-2<CR>==gi", "" },

		["<C-h>"] = { "<Left>", "" },
		["<C-j>"] = { "<Down>", "" },
		["<C-k>"] = { "<Up>", "" },
		["<C-l>"] = { "<Right>", "" },

		["<C-e>"] = { "<End>", "" },
		["<C-b>"] = { "<ESC>^i", "" },
	},
	x = {
		["<leader>p"] = { [["_dP]], "" },
	},
	[{ "n", "v" }] = {
		["<leader>y"] = { [["+y]], "" },
		["<leader>d"] = { [["_d]], "" },
	},
}

return M
