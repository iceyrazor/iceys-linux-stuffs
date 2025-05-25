-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself

    use 'wbthomason/packer.nvim'

    use 'ThePrimeagen/vim-be-good'
    use 'ThePrimeagen/harpoon'

    use 'm4xshen/hardtime.nvim'

    use 'rcarriga/nvim-notify'

    use { "rose-pine/neovim", as = "rose-pine" }

    use "jbyuki/quickmath.nvim"

    use '3rd/image.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8', -- 0.1.5
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use("mbbill/undotree")

    use "lukas-reineke/indent-blankline.nvim"

    use({ "NStefan002/screenkey.nvim", tag = "*" })

    use("catgoose/nvim-colorizer.lua")

    use {
        'nvim-lualine/lualine.nvim',
        --requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

--[[
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate',
        config = function()
        require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "lua", "rust" },
        highlight = { enable = true, }
        }
        end
        })
    ]]--

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'L3MON4D3/LuaSnip'},
        }
    }
end)
