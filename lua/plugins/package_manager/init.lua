vim.cmd("packadd packer.nvim")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

local packer = require("packer")

packer.init({
	profile = {
		enable = true,
		threshold = 1,
	},
})

local plugins = {
	{ "wbthomason/packer.nvim" },
	{ "nvim-lua/plenary.nvim", module = "plenary" },
}

local handle = vim.loop.fs_scandir("lua/plugins")
local exclude = { package_manager = true }
while handle do
	local name, typ = vim.loop.fs_scandir_next(handle)

	if not name then
		-- Done, nothing left
		break
	end

	if (typ == "directory") and not exclude[name] then
		local module = require("plugins." .. name)
		if type(module) == "table" then
			table.insert(plugins, module)
		else
			print("failed to include " .. name .. " is not a table")
		end
	end
end

packer.startup(function(use)
	for _, plugin in ipairs(plugins) do
		use(plugin)
	end
end)
