local lsp_utils = require("lsp/utils")

M = lsp_utils.get_default_lsp()
M.cnd = { "nixd" }
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
                expr = "let flake = builtins.getFlake(toString ./.); in flake.nixosConfigurations.nz.options",
            },
            home_manager = {
                expr = 'let flake = builtins.getFlake(toString ./.); in flake.homeConfigurations."sab@mbp16".options',
            },
            darwin = {
                expr = "let flake = builtins.getFlake(toString ./.); in flake.darwinConfigurations.mbp16.options",
            },
        },
    }
}

return M
