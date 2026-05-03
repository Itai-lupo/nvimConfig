return {
    {
        "olimorris/codecompanion.nvim",
lazy = false, -- Force immediate loading
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "hrsh7th/nvim-cmp",                -- Optional: For completion
            "nvim-telescope/telescope.nvim",   -- Optional: For searching prompts
            { "stevearc/dressing.nvim" }, -- Nice UI for choosing models
        },
        config = function()
            require("plugins.codeCompanion.config")
        end,
        keys = {
            { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat" },
            { "<leader>ai", "<cmd>CodeCompanion<cr>",            desc = "AI Inline (Surgical Fix)" },
            { "ga",         "<cmd>CodeCompanionChat Add<cr>",    mode = "v",                       desc = "Add Visual to AI" },
        },
    },
}
