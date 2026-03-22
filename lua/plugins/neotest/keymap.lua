
local M = {
    n = {
        ["<leader>rf"] = { function() require("neotest").run.run(vim.fn.expand("%")) end, "Run File (Neotest)" },
        ["<leader>rT"] = { function() require("neotest").run.run(vim.uv.cwd()) end, "Run All Test Files (Neotest)" },
        ["<leader>rt"] = { function() require("neotest").run.run() end, "Run Nearest (Neotest)" },
        ["<leader>rl"] = { function() require("neotest").run.run_last() end, "Run Last (Neotest)" },
        ["<leader>ts"] = { function() require("neotest").summary.toggle() end, "Toggle Summary (Neotest)" },
        ["<leader>so"] = { function() require("neotest").output.open({ enter = true, auto_close = true }) end, "Show Output (Neotest)" },
        ["<leader>sO"] = { function() require("neotest").output_panel.toggle() end, "Toggle Output Panel (Neotest)" },
        ["<leader>st"] = { function() require("neotest").run.stop() end, "Stop (Neotest)" },
        ["<leader>wf"] = { function() require("neotest").watch.toggle(vim.fn.expand("%")) end, "Toggle Watch (Neotest)" },
        ["<leader>wt"] = { function() require("neotest").watch.toggle() end, "Toggle Watch (Neotest)" },
        ["<leader>dt"] = { function() require("neotest").run.debug() end, "debug test(Neotest)" },
        ["<leader>df"] = { function() require("neotest").run.debug(vim.fn.expand("%")) end, "debug tests in file(Neotest)" },
        ["<leader>dT"] = { function() require("neotest").run.debug(vim.uv.cwd()) end, "debug all tests(Neotest)" },
        ["<leader>at"] = { function() require("neotest").run.attach() end, "attach debugger to test (Neotest)" },
    },
}

return M
