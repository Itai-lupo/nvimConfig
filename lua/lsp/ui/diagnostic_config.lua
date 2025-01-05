local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
        active = require("lsp/ui/signs"),
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

return config

