local opt = vim.opt

vim.g.mapleader = " "

-- line numbers
opt.nu = true
opt.relativenumber = true

-- tab & indentaion
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.smartindent = true

-- line wrapping
opt.wrap = false

-- swap files & backup
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.undodir"
opt.undofile = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- cursor
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.guicursor = "n:hor100,i-o:ver100"
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
	border = "single",
})
vim.diagnostic.config({ float = { border = "single" } })

opt.fillchars = { eob = " " }
opt.confirm = true

opt.wildignore = {
	"*.o",
	"*.obj",
	"*.a",
	"*.so",
	"*.out",
	"*.class",
	"*.pyc",
	"*.jpg",
	"*.jpeg",
	"*.png",
	"*.gif",
	"*.tiff",
	"*.webp",
	"*.pdf",
	"*.odt",
	"*.odp",
	"*.doc",
	"*.docx",
	"*.ppt",
	"*.csv",
	"__pycache__",
	"*pycache*",
	"**/tmp/**",
	"**/node_modules/**",
	".git",
}

opt.formatoptions:append({ "n" })
opt.formatoptions:remove({ "t", "o", "2" })

-- completion
opt.complete:remove({ "u", "t" })
opt.completeopt:append({ "menuone", "noinsert" })
opt.wildmode = { "longest", "full" }
opt.wildoptions:remove({ "tagfile" })
