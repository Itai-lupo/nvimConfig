local keymap = {
	general = require("keymap.general"),
	telescope = require("plugins.telescope.keymap"),
	maximizer = require("plugins.maximizer.keymap"),
	nvim_tree = require("plugins.nvim_tree.keymap"),
	undotree = require("plugins.undotree.keymap"),
	tag_bar = require("plugins.tag_bar.keymap"),
	fugitive = require("plugins.git.keymap"),
}

for _, section in pairs(keymap) do
	for mode, mode_values in pairs(section) do
		for keybind, mapping_info in pairs(mode_values) do
			local opts = {}
			opts.desc = mapping_info[-1]
			vim.keymap.set(mode, keybind, mapping_info[1], opts)
		end
	end
end
