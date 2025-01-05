local cmd = vim.cmd
local lsp = vim.lsp

local M = {
    [{ "n", "v", "i", "x"}] =
    {
		["C-s"] = { cmd.w, "", "save file" },
        ["<M-j>"] = { ":m+<CR>==", "move line one up" },
		["<M-k>"] = { ":m-2<CR>==", "move line one wn" },
    },
	n = {
		["J"] = { "mzJ`z", "marge this line and the next line to one with no tabs" },

        ["<C-u>"] = { "<C-u>zz", "go half a page up" },
		["<C-d>"] = { "<C-d>zz", "go half a page down" },

		["<leader>f"] = { lsp.buf.format, "format file" },

		["<leader><C-K>"] = { "<cmd>cnext<CR>zz", "go to next compile error" },
		["<leader><C-J>"] = { "<cmd>cprev<CR>zz", "go to last compile error" },

		["<leader>k"] = { "<cmd>lnext<CR>zz", "go to next error in file" },
		["<leader>j"] = { "<cmd>lprev<CR>zz", "go to prev error in file" },

		["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "find and replace" },
		["<leader>x"] = { "<cmd>!chmod +x %<CR>", { silent = true }, "make file executable" },
		["<leader><leader>"] = {
			function()
				cmd("w")
				cmd("so")
			end,
			"reload config and save curren file",
		},

		["<leader>+"] = { "<C-a>", "add one to number" },
		["<leader>-"] = { "<C-x>", "remove one from number" },


		-- window management
		["<leader>sv"] = { "<C-w>v", "split window vertically" },
		["<leader>sh"] = { "<C-w>s", "split window horizontally" },
		["<leader>se"] = { "<C-w>=", "make split windows equal width & height" },
		["<leader>sx"] = { ":close<CR>", "close current split window" },

		["<leader>to"] = { ":tabnew<CR>", "open new tab" },
		["<leader>tx"] = { ":tabclose<CR>", "close current tab" },
		["<leader>tn"] = { ":tabn<CR>", "go to next tab" },
		["<leader>tp"] = { ":tabp<CR>", "go to previous tab" },

        ["m"] = {[[:Man <C-r><C-w> <CR>]], "open man page of word under curser"},
        ["m2"] = {[[:Man 2 <C-r><C-w> <CR>]], "open man 2 page"},
        ["m3"] = {[[:Man 3 <C-r><C-w> <CR>]], "open man 3 page"},
        ["m7"] = {[[:Man 7 <C-r><C-w> <CR>]], "open man 7 page"},
	},
	v = {
		["<M-j>"] = { ":m '>+1<CR>gv=gv", "move marked a line up" },
		["<M-k>"] = { ":m '<-2<CR>gv=gv", "move marged a line down" },
	},
	i = {
		["<M-j>"] = { "<Esc>:m+<CR>==gi", "move line up" },
		["<M-k>"] = { "<Esc>:m-2<CR>==gi", "move line down" },

		["<C-h>"] = { "<Left>", "move left" },
		["<C-j>"] = { "<Down>", "move down" },
		["<C-k>"] = { "<Up>", "move up" },
		["<C-l>"] = { "<Right>", "move right" },

		["<C-e>"] = { "<End>", "move to end of line" },
		["<C-b>"] = { "<ESC>^i", "move to start of line" },
	},
}

return M
