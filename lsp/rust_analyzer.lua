local lsp_utils = require("lsp/utils")

M = lsp_utils.get_default_lsp("rust_analyzer", {
    keymap = {
        n = {
            ["<leader>rr"] = { "<cmd>RustRunnables<cr>", " list of rust runnables" },
            ["<leader>rd"] = { "<cmd>RustDebuggables<cr>", "Select and debug a test." },
            ["<leader>rC"] = { "<cmd>RustOpenCargo<cr>", "open cargo file." },
            ["<leader>rM"] = { "<cmd>RustExpandMacro<cr>", "Expand macros recursively." },
            ["<leader>rc"] = { "<cmd>RustCodeAction<cr>", "Run code actions" },
            ["<leader>rh"] = { "<cmd>RustHoverActions<cr>", " Show hover actions." },
        }
    }
})

M.cmd = { "rust-analyze" }

M.filetypes = { "rust" }

M.root_dir = vim.fs.root(0, { "Cargo.toml", "rust-project.json" })

M.settings = {
    ["rust-analyzer"] = {
        checkOnSave = true,
        cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            buildScripts = { enable = true },
        },
        procMacro = {
            enable = true,
        },
        diagnostics = {
            enable = true,
        },
        inlayHints = {
            enable = true,
            typeHints = true,
            parameterHints = { enable = true },
            closureReturnTypeHints = { enable = "always" },
        },
        rustfmt = {
            config_path = ".",
        },
    }
}

M.tools = {
    runnables = { use_telescope = true },
    debuggables = { use_telescope = true },
}

return M
