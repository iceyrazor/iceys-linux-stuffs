local telescope = require('telescope')
local builtin = require('telescope.builtin')
if string.find(vim.loop.cwd(),"iceys%-linux%-stuffs") then
    telescope.setup{
        pickers = {
            find_files = {
                hidden=true
            }
        }
    }
end
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pw', builtin.pickers, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
--vim.keymap.set('n', '<C-p>', builtin.git_files, {})
