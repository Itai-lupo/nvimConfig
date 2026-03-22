local lsp_utils = require("lsp/utils")

M = lsp_utils.get_default_lsp()
M.settings = {
    filetypes = { "sh", "zsh", "fish" },
}

return M
