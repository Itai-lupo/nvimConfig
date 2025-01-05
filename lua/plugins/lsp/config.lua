local lsp = require("lsp-zero")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local keymap = vim.keymap

lsp.preset({
    manage_nvim_cmp = {
        set_sources = "recommended",
        set_basic_mappings = true,
        set_extra_mappings = true,
        use_luasnip = true,
        set_format = true,
        documentation_window = true,
    },
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
--
lsp.on_attach(function(client, bufnr)
    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)                     -- show definition, references
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)          -- got to declaration
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)                -- see definition and make edits in window
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)       -- go to implementation
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)            -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)                 -- smart rename
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)   -- show  diagnostics for line
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)           -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)           -- jump to next diagnostic in buffer
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                       -- show documentation for what is under cursor
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)                 -- see outline on right hand side

    -- typescript specific keymaps (e.g. rename file and update imports)
    if client.name == "tsserver" then
        keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")      -- rename file and update imports
        keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
        keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>")    -- remove unused variables (not in youtube nvim video)
    end
    local opts = { buffer = bufnr, remap = false }
end)

lsp.format_mapping("<leader>fd", {
    format_opts = {
        async = true,
    },
    servers = {
        ["null-ls"] = { "javascript", "typescript", "lua", "c", "cpp" },
    },
})

lsp.format_on_save({
    servers = {
        ["null-ls"] = { "javascript", "typescript", "lua", "cpp", "c" },
    },
})

require("lspconfig").clangd.setup({
    cmd = { "clangd", "--clang-tidy" }
})
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
require("lspconfig").ts_ls.setup({
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
})

require("lspconfig").ols.setup({})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
