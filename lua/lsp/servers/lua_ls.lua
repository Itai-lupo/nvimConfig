local lsp_utils = require("lsp/utils")

M = lsp_utils.get_default_lsp()

M.settings = { Lua = {
    diagnostics = {
        globals = { "vim" },
    },
    workspace = {
        library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
        },
    },
} }

return M
