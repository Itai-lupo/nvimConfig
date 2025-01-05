local lsp_utils = require("lsp/utils")

M = lsp_utils.get_default_lsp()
M.on_attach = function (client, bufnr)
    lsp_utils.on_attach(client, bufnr)
    local opts = { noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-h>", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
end

return M
