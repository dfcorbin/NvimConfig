vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.mapleader = ','

vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.clipboard = 'unnamedplus'

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

vim.keymap.set('i', 'jk', '<esc>')

local wk = require("which-key")
local builtin = require('telescope.builtin')
wk.register(
    {
        name = 'Find',
        f = { builtin.find_files, 'Find Files' },
        g = { builtin.live_grep, 'Live Grep' },
        b = { builtin.buffers, 'Find Buffers' },
        h = { builtin.help_tags, 'Find Help' },
        t = { '<cmd>Telescope file_browser<cr>', 'File Browser' }
    },
    { mode = 'n', prefix = '<Leader>f' }
)

require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}

-- Or we can use mason-lspconfig automatic server setup.
require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup {
            settings = { Lua = {
                diagnostics = { globals = { "vim" } }
            } }
        }
    end
}
