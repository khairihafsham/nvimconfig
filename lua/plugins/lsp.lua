return {
    {'ionide/Ionide-vim'},
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = {'c_sharp', 'python', 'elixir', 'fsharp', 'bash', 'c', 'ruby'},
            auto_install = true,
            highlight = {
                enable = true,
            }
        }
    },
    {'SirVer/ultisnips'},
    {
        'quangnguyen30192/cmp-nvim-ultisnips',
        config = function()
          -- optional call to setup (see customization section)
          require("cmp_nvim_ultisnips").setup {}
        end
    },
    {'honza/vim-snippets'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'SirVer/ultisnips',
            'quangnguyen30192/cmp-nvim-ultisnips',
        },
        opts = function()
            local cmp = require("cmp")
            local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
            return {
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    -- ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
                    -- ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    -- ["<C-CR>"] = function(fallback)
                    --    cmp.abort()
                    --    fallback()
                    -- end,
                    ["<Tab>"] = cmp.mapping(
                        function(fallback)
                            cmp_ultisnips_mappings.compose { "expand", "select_next_item" }(fallback)
                        end,
                        { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
                    ),
                    ["<S-Tab>"] = cmp.mapping(
                        function(fallback)
                            cmp_ultisnips_mappings.jump_backwards(fallback)
                        end,
                        { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
                    ),
                }),
                snippet = {
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body)
                    end,
                },
                sources = cmp.config.sources({
                    { name = 'ultisnips' },
                    { name = "copilot", group_index = 2 },
                    { name = "lazydev" },
                    { name = "nvim_lsp" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
            }
        end,
    },
    -- {'hrsh7th/cmp-vsnip'},
    -- {'hrsh7th/vim-vsnip'},
}
