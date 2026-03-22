local lsp_utils = require("lsp/utils")

M = lsp_utils.get_default_lsp({
    keymap = {
        n = { ["<M-h>"] = { "<cmd>ClangdSwitchSourceHeader<CR>", "switch to header file" } }
    }
})

M.cmd = { "clangd",
    "--background-index",
    "-j=12",
    "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
    "--clang-tidy",
    "--log=verbose",
    "--all-scopes-completion",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--header-insertion-decorators=0",
    "--header-insertion=never",
    "--function-arg-placeholders",
    "--pch-storage=memory",
    "--enable-config"
}

return M
