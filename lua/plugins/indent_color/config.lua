

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75", bg = "#111111" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B", bg = "#111111" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF", bg = "#111111" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66", bg = "#111111" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379", bg = "#111111" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD", bg = "#111111" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2", bg = "#111111" })
end)

local ibl = require("ibl")

vim.g.rainbow_delimiters = { highlight = highlight }
ibl.setup({
    indent = {
        char = "│",
        tab_char = "│",
        highlight = highlight,
        smart_indent_cap = true,
        priority = 5,
    },
    whitespace = {
        remove_blankline_trail = true,
        highlight = highlight
    },
    scope = {
        enabled = true,
        highlight = highlight,
        show_start = true,
        show_end = true,
        show_exact_scope = true,
        priority = 2,
        char = "║"
    }
})


hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
