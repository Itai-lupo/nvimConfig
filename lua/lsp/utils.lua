local M = {}

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlight then
        vim.api.nvim_exec(
            [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            false
        )
    end
end

local function set_lsp_keymap(bufnr, keymap)
    for mode, mode_values in pairs(keymap) do
        for keybind, mapping_info in pairs(mode_values) do
            local opts = { noremap = true, silent = true }
            opts.desc = mapping_info[#mapping_info]
            vim.api.nvim_buf_set_keymap(bufnr, mode, keybind, mapping_info[1], opts)
        end
    end
end

local lsp_default_keymap = {
    n = {
        ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "" },
        ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", " list all refernces to symbole( e.g find all calls to a function)" },
        ["gL"] = { '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })<CR>', "show line diagnostic" },
        ["<leader>q"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "" },
        ["gf"] = { "<cmd>Lspsaga lsp_finder<CR>", "show definition, references" },
        ["gD"] = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "got to declaration" },
        ["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "see definition and make edits in window" },
        ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "go to implementation" },
        ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "see available code actions" },
        ["<leader>rn"] = { "<cmd>Lspsaga rename<CR>", "smart rename" },
        ["gl"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "show  dia" },
        ["gc"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "show diagnostics for cursor" },
        ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "jump to previous diagnostic in buffer" },
        ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "jump to next diagnostic in buffer" },
        ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "show documentation for what is under cursor" },
        ["<leader>o"] = { "<cmd>LSoutlineToggle<CR>", "see outline on right hand side" },
    },
}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
    M.capabilities = cmp_nvim_lsp.default_capabilities()
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        set_lsp_keymap(bufnr, lsp_default_keymap)
        lsp_highlight_document(client)
    end,
})


M.get_default_lsp = function(name, opts)
    local keymap = lsp_default_keymap
    if opts ~= nil and opts.keymap ~= nil then
        keymap = vim.tbl_deep_extend("force", keymap, opts.keymap)
    end

    local function default_on_attach(args)
        local bufnr = args.buf
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        if opts ~= nil and client.name == name then
            if opts.keymap ~= nil then
                set_lsp_keymap(bufnr, opts.keymap)
            end
            if opts.on_attach ~= nil then
                opts.on_attach(client, bufnr)
            end
        end
    end

    vim.api.nvim_create_autocmd('LspAttach', {
        callback = default_on_attach
    })

    return { capabilities = M.capabilities }
end

return M
