local null_ls = require("null-ls")

null_ls.setup({
	on_attach = function(client, bufnr)
		local format_files = { "c", "cpp", "lua" }

		if vim.tbl_contains(format_files, vim.bo.filetype) then
			require("lsp-zero").async_autoformat(client, bufnr)
		end
	end,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
	},
})
