local lsp_utils = require("lsp/utils")

M = lsp_utils.get_default_lsp("clangd", {
    keymap = {
        n = { ["<M-h>"] = { "<cmd>ClangdSwitchSourceHeader<CR>", "switch to header file" } }
    }
})

M.cmd = { "clangd",
    "--background-index",
    "-j=12",
    "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
    "--clang-tidy",
    "--log=verbose",
    "--all-scopes-completion",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--header-insertion-decorators=0",
    "--header-insertion=never",
    "--function-arg-placeholders",
    "--pch-storage=memory",
    "--enable-config",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
}

M.filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
M.root_dir = vim.fs.root(0,
    {
        "compile_commands.json",
        "Makefile",
        ".git"
    }
)

M.capabilities = {
    offsetEncoding = "utf-16",
}

M.init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
}

M.settings = {
    ["clangd"] = {
        fallbackFlags = { "-std=gnu++b" },
    },
}

return M
