local M = {
    {
        "folke/trouble.nvim",
        config = function()
            require("plugins.trouble.config")
        end,

        keys = {
            {
                "<leader>td",
                "<cmd>Trouble diagnostics toggle focus=true <cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>tD",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>ty",
                "<cmd>Trouble symbols toggle focus=true<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>tl",
                "<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>tL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>tq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
}

return M
