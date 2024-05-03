return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "frappe"
            })
            vim.cmd.colorscheme "catppuccin"
        end
    },
    'nvim-tree/nvim-web-devicons',
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true }
            }
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build =
                'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            },
            "nvim-telescope/telescope-file-browser.nvim"
        },
        config = function()
            require('telescope').setup {
                pickers = {
                    find_files = { theme = 'dropdown' }
                }
            }
            require('telescope').load_extension 'fzf'
            require("telescope").load_extension 'file_browser'
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup {}
        end
    },
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'petertriho/cmp-git',
    {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    'saadparwaiz1/cmp_luasnip',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        opts = { check_ts = true }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup()
        end
    },
    {
        'mhinz/vim-startify',
        config = function()
            vim.g.startify_session_dir = '~/.config/nvim/sessions'
            vim.g.startify_lists = {
                { type = 'sessions', header = { 'Sessions' } },
                { type = 'bookmarks', header = {'Bookmarks'}},
                { type = 'files',    header = { 'Recently Used' } },
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
        end
    },
    {
        'smoka7/hop.nvim',
        version = "*",
        config = function()
            local hop = require('hop')
            hop.setup({})
            local directions = require('hop.hint').HintDirection
            vim.keymap.set('', 'f', function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
            end, { remap = true })
            vim.keymap.set('', 'F', function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
            end, { remap = true })
        end
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function ()
            require('Comment').setup {}
        end
    }
}
