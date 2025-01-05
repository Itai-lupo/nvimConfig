local lsp_utils = require("lsp/utils")

M = lsp_utils.get_default_lsp()

M.init_options = {
    init_options = {
        settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
        }
    }
}

return M
