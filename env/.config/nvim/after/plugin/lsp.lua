local ok, _ = pcall(require, 'lsp-zero')
if ok then
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "src",
        callback = function()
            print("LSP should now be active for src files")
        end,
    })

    local lsp = require("lsp-zero")

    lsp.preset("recommended")


    local cmp = require('cmp')

    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    local cmp_mappings = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    })

    cmp.setup({
        mapping = cmp_mappings,
    })

    vim.diagnostic.config({
        virtual_text = true,
    })

    lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

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
    end)


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

    -- to learn how to use mason.nvim with lsp-zero
    -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
    require('mason').setup({
        registries = {
            "github:mason-org/mason-registry",
        },
    })
    require('mason-lspconfig').setup({
        ensure_installed = { },
        handlers = {
            lsp.default_setup,
        },
    })
    require('lspconfig').greybel.setup({})

    lsp.setup()
end
