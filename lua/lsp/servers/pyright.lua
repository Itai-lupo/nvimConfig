local lsp_utils = require("lsp/utils")

M = lsp_utils.get_default_lsp()

M.settings = {
    pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
    },
    python = {
        analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { '*' },
        },
    },
}

return M
