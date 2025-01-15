local lsp_utils = require("lsp/utils")

M = lsp_utils.get_default_lsp()
M.cmd = { "nixd"}
M.root_dir = require('lspconfig/util').root_pattern('.git', 'flake.nix', 'default.nix')

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
            command = { "nix fmt" },     -- or nixfmt or nixpkgs-fmt
        },
        options = {
            nixos = {
                expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.k-on.options',
            },
            home_manager = {
                expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."ruixi@k-on".options',
            },
        },
    }
}

return M
