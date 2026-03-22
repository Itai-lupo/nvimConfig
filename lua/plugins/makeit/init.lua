local M = {
    "Zeioth/makeit.nvim",
    dependencies = {
        {
            "stevearc/overseer.nvim",
            opts = {
                task_list = {
                    direction = "bottom",
                    min_height = 25,
                    max_height = 25,
                    default_detail = 1
                },
            },
        },
    },
    opts = {},
    config = function()
        require("plugins.makeit.config")
    end,
}

return M
