local lsp_utils = require("lsp/utils")
local capabilities = vim.lsp.protocol.make_client_capabilities()

M = lsp_utils.get_default_lsp()
M.cmd = { "nixd" }
M.root_markers = { "flake.nix", ".git" }
M.filetypes = { "nix" }

M.settings = {
    nixd = {
        nixpkgs = {
            -- For flake.
            -- This expression will be interpreted as "nixpkgs" toplevel
            -- Nixd provides package, lib completion/information from it.
            -- Resource Usage: Entries are lazily evaluated, entire nixpkgs takes 200~300MB for just "names".
            -- Package documentation, versions, are evaluated by-need.
            expr = "import (builtins.getFlake(toString ./.)).inputs.nixpkgs { }",
        },
        formatting = {
            command = { "nixpkgs-fmt"},
        },
        options = {
            nixos = {
                expr =
                [[(let flake = builtins.getFlake (toString ./.); in (builtins.head (builtins.attrValues flake.nixosConfigurations)).options)]],
            },
            ["home-manager"] = {
                expr =
                [[(let flake = builtins.getFlake (toString ./.); in (builtins.head (builtins.attrValues flake.homeConfigurations)).options)]],
            },
        },
    }
}

return M
