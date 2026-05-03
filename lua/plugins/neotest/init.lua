local share_dir = vim.fn.stdpath("data")
if vim.fn.isdirectory(share_dir) == 0 then
  vim.fn.mkdir(share_dir, "p")
end

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
