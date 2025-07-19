-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- # learning

    use 'ThePrimeagen/vim-be-good'
    -- use 'vuciv/golf' --vim daily task
    use 'm4xshen/hardtime.nvim'


    -- # niceties

    use 'rcarriga/nvim-notify'

    use { "rose-pine/neovim", as = "rose-pine" }
    use { "folke/tokyonight.nvim", as = "tokyonight"}

    use "jbyuki/quickmath.nvim"

    use '3rd/image.nvim'


    use "lukas-reineke/indent-blankline.nvim"

    use({ "NStefan002/screenkey.nvim", tag = "*" })


    use("catgoose/nvim-colorizer.lua")
    use {
        'nvim-lualine/lualine.nvim',
        --requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    --use "jbyuki/venn.nvim"

    use 'tpope/vim-fugitive'


    -- # main dev requirements
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use 'ThePrimeagen/harpoon'
    use("mbbill/undotree")

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8', -- 0.1.5
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            "jay-babu/mason-nvim-dap.nvim",
            -- Autocompletion
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            --snippets
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        }
    }

    use 'folke/trouble.nvim'

    use 'mfussenegger/nvim-lint'
    use 'nvimtools/none-ls.nvim'

    -- to dap, or not to dap? tis the question
    -- ill trya dap

    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })


    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
        -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
        -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    })
end)
