local comment = require("Comment.api")

local esc = vim.api.nvim_replace_termcodes(
    '<ESC>', true, false, true
)

local keymap = {
    {
        "<leader>c",
        comment.call('toggle.blockwise', 'g@'),
        expr = true,
        desc = "toggle line comment"
    },
    {
        "<leader>cc",
        function()
            comment.toggle.linewise.count(1)
        end,
        desc = "toggle comment one line, the vim way"
    },
    {
        "<leader>c",
        function()
            vim.api.nvim_feedkeys(esc, 'nx', false)
            comment.toggle.blockwise(vim.fn.visualmode())
        end,
        mode = "x",
        desc = "toggle comment on marked text, the vim way"
    },
    {
        "<C-_>",
        function()
            vim.api.nvim_feedkeys(esc, 'nx', false)
            comment.toggle.blockwise(vim.fn.visualmode())
        end,
        mode = 'x',
        desc = "toggle comment on marked text, the vs code way"
    },
    {
        "<C-_>",
        function()
            comment.toggle.linewise.count(1)
        end,
        desc = "toggle comment one line, the vs code way"
    }
}

return keymap
