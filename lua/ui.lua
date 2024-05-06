-- load colorscheme
require("catppuccin").setup({ flavour = "frappe" })
vim.cmd.colorscheme "catppuccin"

-- configure file tree
require 'nvim-treesitter.configs'.setup {
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true }
}

-- telescope configuration
require('telescope').setup {
    pickers = {
        find_files = { theme = 'dropdown' }
    }
}
require('telescope').load_extension 'fzf'
local tel_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tel_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', tel_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', tel_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', tel_builtin.help_tags, {})

-- start screen and session management
vim.g.startify_session_dir = '~/.config/nvim/sessions'
vim.g.startify_lists = {
    { type = 'sessions',  header = { 'Sessions' } },
    { type = 'bookmarks', header = { 'Bookmarks' } },
    { type = 'files',     header = { 'Recently Used' } },
}
vim.g.startify_bookmarks = { '~/.config/nvim' }
vim.g.startify_custom_header = {
    '▄▄    ▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄ ▄▄   ▄▄ ',
    '█  █  █ █       █       █  █ █  █   █  █▄█  █',
    '█   █▄█ █    ▄▄▄█   ▄   █  █▄█  █   █       █',
    '█       █   █▄▄▄█  █ █  █       █   █       █',
    '█  ▄    █    ▄▄▄█  █▄█  █       █   █       █',
    '█ █ █   █   █▄▄▄█       ██     ██   █ ██▄██ █',
    '█▄█  █▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█ █▄▄▄█ █▄▄▄█▄█   █▄█',
}

-- jump to characters using 'f'/'F'
local hop = require('hop')
hop.setup({})
local hop_directions = require('hop.hint').HintDirection
vim.keymap.set(
    '',
    'f',
    function()
        hop.hint_char1({ direction = hop_directions.AFTER_CURSOR, current_line_only = false })
    end,
    { remap = true }
)
vim.keymap.set(
    '',
    'F',
    function()
        hop.hint_char1({ direction = hop_directions.BEFORE_CURSOR, current_line_only = false })
    end,
    { remap = true }
)

-- improve access to neovim terminal buffers
require("toggleterm").setup {
    open_mapping = "<c-'>",
    autochdir = true,
}

-- file explorer
require("nvim-tree").setup()
vim.keymap.set(
    'n',
    '<leader>tt',
    '<cmd>NvimTreeToggle<CR>'
)
vim.keymap.set(
    'n',
    '<leader>tf',
    '<cmd>NvimTreeFindFile<CR>'
)
vim.keymap.set(
    'n',
    '<leader>tc',
    '<cmd>NvimTreeCollapse<CR>'
)

require("ibl").setup()     -- show indentation guides
require('Comment').setup() -- shortcuts for commenting lines
