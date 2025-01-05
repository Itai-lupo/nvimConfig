local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end


local servers = {}

local servers_path = vim.fn.stdpath('config') .. '/lua/lsp/servers'

for _, file in ipairs(vim.fn.readdir(servers_path)) do
    local file_name = file:match("(.*).lua$")
    local server = require("lsp.servers." .. file_name)
    if type(server) == "table" then
        servers[file_name] = server
    else
        print("failed to include " .. file .. " is not a table")
    end
end

local config = require("lsp/ui/diagnostic_config")
vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

for server_name, server_settings in pairs(servers) do
    lspconfig[server_name].setup(server_settings)
end
