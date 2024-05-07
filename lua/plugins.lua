return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = "nvim-lua/plenary.nvim",
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        build = "make install_jsregexp",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = { check_ts = true },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },
    {
        "smoka7/hop.nvim",
        version = "*",
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = "nvim-tree/nvim-web-devicons",
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
        'nanozuki/tabby.nvim',
        event = 'VimEnter',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    {
        "yorickpeterse/nvim-window",
        keys = {
            {
                "<leader>w",
                "<cmd>lua require('nvim-window').pick()<cr>",
                desc = "nvim-window: Jump to window"
            },
        },
        config = true,
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "petertriho/cmp-git",
    "saadparwaiz1/cmp_luasnip",
    "mhinz/vim-startify",
    "nvim-tree/nvim-web-devicons",
    "mhartington/formatter.nvim",
}
