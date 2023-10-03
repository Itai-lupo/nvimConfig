local cmp = require("cmp")

local luasnip = require("luasnip")
-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

require("luasnip.loaders.from_vscode").lazy_load()

local winhighlight = {
	winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
      col_offset = -3,
      side_padding = 0,
}




-- vim.opt.completeopt = "menu,menuone,noselect"
cmp.setup({

	formatting = {

			fields = { "menu", "abbr", "kind" },
		format = function(entry, vim_item)
			print(vim_item)
			vim_item.kind = require("lsp.ui.completion").kind({
			text = true,
				icon = "codicon",
			})[vim_item.kind]

			vim_item.menu = ({
				luasnip = "[LuaSnip]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[Neovim Lua]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,preview,noinsert",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-a>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "path" }, -- file system paths
		{ name = "luasnip" }, -- snippets
		{ name = "nvim_lsp" }, -- lsp
		{ name = "nvim_lua" },
		{ name = "buffer" }, -- text within current buffer
	}),

	window = {
		completion = cmp.config.window.bordered(winhighlight),
		documentation = cmp.config.window.bordered(winhighlight),
	},
	experimental = { ghost_text = true },
})
local lspkind = require('lspkind')

print("b")
