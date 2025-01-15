local M = {
    "folke/which-key.nvim",
    config = function()
        require("plugins.which_key.config")
    end,
    event = "VeryLazy",
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = true })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}

return M
