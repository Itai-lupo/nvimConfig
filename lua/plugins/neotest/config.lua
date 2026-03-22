local neotest = require("neotest")
local gtest = require("neotest-gtest")
local pytest = require("neotest-python")


neotest.setup({
    adapters = {
        gtest.setup({
            is_test_file = function(file)
                return vim.endswith(file, "test.cpp")
            end,
            filter_dir = function(name, rel_path, root)
                return true
            end,
            mappings = { configure = "<leader>tc" }
        }),
        pytest({ dap = { justMyCode = false } })
    }
})
