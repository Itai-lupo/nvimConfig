local M = {
    n = {
        ["<leader>aa"] = {"<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat" },
        ["<leader>ai"] = {"<cmd>CodeCompanionChat<cr>", desc = "AI Inline (Surgical Fix)" },

    }
    v = {
        ["ga"] = {"<cmd>CodeCompanionChat Toggle<cr>", desc = "Add Visual to AI" },
    }
}

-- return M
