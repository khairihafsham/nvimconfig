return {
    {"khairihafsham/Wombat"},
    {'Mofiqul/dracula.nvim'},
    {"tpope/vim-sensible"},
    {"preservim/nerdtree"},
    {"preservim/nerdcommenter"},
    {"tpope/vim-surround"},
    {"ervandew/supertab"},
    {"kien/ctrlp.vim"},
    {"tpope/vim-fugitive"},
    {'folke/tokyonight.nvim'},
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        opts = {}
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        'nvim-telescope/telescope-project.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
    }
}
