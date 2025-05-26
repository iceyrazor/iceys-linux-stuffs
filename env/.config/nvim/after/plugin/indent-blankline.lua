local ok, _ = pcall(require, 'ibl')
if ok then
    local highlight = {
        "RainbowRed",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#702ec0" })
    end)

    require('ibl').setup {
        indent = {
            char = '|',
            highlight = highlight,
        },
        scope = {
            show_start = false,
            show_end = false,
            show_exact_scope = false,
        },
        exclude = {
            filetypes = {
                'help',
                'packer',
                'undotree',
                'diff',
            },
        },
    }
end
