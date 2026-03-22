local M = {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/nvim-nio",
        { "alfaix/neotest-gtest", dependencies = { "nvim-lua/plenary.nvim" } },
        "nvim-neotest/neotest-python"
    },
    config = function()
        require("plugins.neotest.config")
    end,
}

return M
