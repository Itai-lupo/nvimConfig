local lazypath = vim.fn.stdpath("config") .. "/.plugins/lazy.nvim/"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { "nvim-lua/plenary.nvim", module = "plenary" },
    {"folke/lazy.nvim"}
}

local exclude = { package_manager = true }
local plugins_path = vim.fn.stdpath('config') .. '/lua/plugins'
for _, file in ipairs(vim.fn.readdir(plugins_path, [[v:val !~ '\.lua$']])) do
    if not exclude[file] then
        local module = require("plugins." .. file)
        if type(module) == "table" then
            table.insert(plugins, module)
        else
            print("failed to include " .. file .. " is not a table")
        end
    end
end

require("lazy").setup(plugins, {
    root = vim.fn.stdpath('config') .. '/.plugins/',
    lockfile = vim.fn.stdpath("config") .. "/.plugins/lazy-lock.json"
})
