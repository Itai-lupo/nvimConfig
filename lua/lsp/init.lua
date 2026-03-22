local servers = {}

local lsp_dir = vim.fn.stdpath('config') .. '/lsp'

for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
    local file_name = file:match("(.*).lua$")
    table.insert(servers, file_name)
end

local config = require("lsp/ui/diagnostic_config")
vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

vim.lsp.enable(servers)
