local lsp_utils = require("lsp/utils")

M = lsp_utils.get_default_lsp({ keymap = {
    n = { ["<M-h>"] = {"<cmd>ClangdSwitchSourceHeader<CR>", "switch to header file" }}
}})

M.cmd = { "clangd", "--clang-tidy" }
return M
