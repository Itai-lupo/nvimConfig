local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		layout_strategy = "flex",
		layout_config = {
			height = 0.8,
			horizontal = { preview_width = 80 },
		},
		winblend = vim.api.nvim_get_option("pumblend"),
		prompt_prefix = "   ",
		selection_caret = " ",
		dynamic_preview_title = true,
		file_ignore_patterns = {
			"%.class",
			"%.gif",
			"%.jpg",
			"%.jpeg",
			"%.JPEG",
			"%.o",
			"%.png",
			"%.PNG",
			"%.pyc",
			"%.pyi",
			"%.webp",
			".dart_tool/",
			".env/",
			".git/",
			".github/",
			".gradle/",
			".idea/",
			".settings/",
			".vscode/",
			"__pycache__",
			"build/",
			"env/",
			"gradle/",
			"node_modules/",
			"target/",
			"vendor",
		},
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
	pickers = {
		find_files = {
			path_display = { "smart" },
			theme = "ivy",
		},
		file_browser = {
			prompt_prefix = "   ",
			hidden = true,
		},
		buffers = {
			prompt_prefix = "   ",
			path_display = { "smart" },
			theme = "dropdown",
			previewer = false,
		},
		live_grep = {
			prompt_prefix = "   ",
			theme = "dropdown",
		},
		filetypes = {
			layout_config = {
				width = 0.25,
				height = 0.5,
			},
			prompt_prefix = "   ",
		},
		git_files = {
			path_display = { "smart" },
		},
		git_status = {
			layout_config = { width = 0.5 },
			path_display = { "smart" },
			previewer = false,
			git_icons = {
				added = "",
				changed = "",
				copied = "",
				deleted = "",
				renamed = "",
				unmerged = "",
				untracked = "",
			},
		},
		lsp_code_actions = {
			prompt_prefix = " ﯧ  ",
			theme = "cursor",
		},
		lsp_range_code_actions = {
			prompt_prefix = " ﯧ  ",
			theme = "cursor",
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

telescope.load_extension("fzf")
