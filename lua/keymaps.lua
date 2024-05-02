vim.keymap.set('i', 'jk', '<esc>')

local wk = require("which-key")
local builtin = require('telescope.builtin')
wk.register(
    {
        name = 'Find',
        f = {builtin.find_files, 'Find Files'},
        g = {builtin.live_grep, 'Live Grep'},
        b = {builtin.buffers, 'Find Buffers'},
        h = {builtin.help_tags, 'Find Help'},
        t = {'<cmd>Telescope file_browser<cr>', 'File Browser'}
    },
    { mode = 'n', prefix = '<Leader>f' }
)

