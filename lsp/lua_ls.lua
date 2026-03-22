local lsp_utils = require("lsp/utils")

M = lsp_utils.get_default_lsp()

M.cmd = { "lua-language-server" }
M.filetypes = { "lua" }

M.root_markers = { ".git"}

M.on_init = function(client)
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = {
            version = "LuaJIT",
            path = { "lua/?.lua", "lua/?/init.lua" },
        },
        diagnostics = { globals = { "vim" } },
        workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME },
        },
        telemetry = { enable = false },
    })
end

M.settings = {
    Lua = {
        diagnostics = {
            globals = { "vim" },
        },
        workspace = {
            library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
            },
        },
    }
}

return M
