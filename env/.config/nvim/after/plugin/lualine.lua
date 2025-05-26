local ok, lualine = pcall(require, 'lualine')
if ok then
    -- require('lualine').setup()

    local custom_gruvbox = require'lualine.themes.base16'

    -- Change the background of lualine_c section for normal mode
    custom_gruvbox.normal.c.bg = '#222222'

    local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error' , 'warn' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        update_in_insert = false,
        allways_visible = false,
        cond = hide_in_width,
    }

    lualine.setup {
        options = {
            theme  = custom_gruvbox,
            icons_enabled = true,
            disabled_filetypes = {'undotree', 'diff'},
        },
        sections = {
            lualine_a = {{
                'mode',
                fmt = function(str)
                    return ' ' .. str
                end,
            }},
            lualine_b = {'branch', 'diff', diagnostics},
            lualine_c = {{
                'filename',
                file_status = true,
                path = 0,
            }},
            --lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_x = {{'encoding', cond=hide_in_width}, {'filetype',cond=hide_in_width}},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        }
    }
end
