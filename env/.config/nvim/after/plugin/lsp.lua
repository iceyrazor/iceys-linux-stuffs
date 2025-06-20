local on_atk = function(ev)
    local opts = {buffer = ev.buf, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

local ok, trouble = pcall(require, 'trouble')
if ok then
    trouble.setup({ icons = {} })
    vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")

    vim.keymap.set("n", "[t", function()
        trouble.next({skip_groups = true, jump = true})
    end)

    vim.keymap.set("n", "]t", function()
        trouble.prev({skip_groups = true, jump = true})
    end)
end


local ok, cmp = pcall(require, 'cmp')
if ok then
    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
            -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        }, {
            { name = 'buffer' },
        })
    })

    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    --[[ cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'git' },
        }, {
            { name = 'buffer' },
        })
    })
    require("cmp_git").setup() ]]-- 

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
    })
end



local ok, lsp = pcall(require, 'lspconfig')
if ok then
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "src",
        callback = function()
            print("LSP should now be active for src files")
        end,
    })


    vim.diagnostic.config({
        update_in_insert = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        }
    })

    vim.diagnostic.config({ virtual_text = true })

    local lsp_configurations = require('lspconfig.configs')

    if not lsp_configurations.greybel then
        lsp_configurations.greybel = {
            default_config = {
                cmd = { "/bin/greybel-languageserver", "--stdio" },
                filetypes = { "greyscript" },
                root_dir = require('lspconfig.util').root_pattern(".git", vim.fn.getcwd()),
                settings = {},
            }
        }
    end


    local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities()
    )

    require('mason').setup({
        registries = {
            "github:mason-org/mason-registry",
        },
    })
    require('mason-nvim-dap').setup({
        ensure_installed = {
            "codelldb",
        },
        handlers = {
            function(config)
                require("mason-nvim-dap").default_setup(config)
            end,
        }
    })
    require('mason-lspconfig').setup({
        ensure_installed = {
            --"markdownlint-cli2",
            --"markdown-toc",
            "bashls",
            "clangd",
            "html",
            "cssls",
            "lua_ls",
            "rust_analyzer",
            "ts_ls",
        },
        handlers = {
            function(server_name)
                lsp[server_name].setup{capabilities = capabilities}
            end,
            ["lua_ls"] = function ()
                lsp.lua_ls.setup {
                    capabilities = capabilities,
                    settings = {
                        Lua ={
                            diagnostics = {
                                globasl = { "vim" }
                            }
                        }
                    }
                }
            end
        }
    })


    vim.filetype.add({
        extension = {
            src = "greyscript"
        }
    })

    lsp.greybel.setup({})

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = on_atk
    })
end
