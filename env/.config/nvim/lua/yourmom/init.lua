require("yourmom.remap")

vim.opt.guicursor=""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent=true

vim.opt.wrap = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.o.ignorecase = true

vim.opt.updatetime = 50
--vim.opt.colorcolumn = "80"
--vim.cmd('colorscheme vim')
vim.cmd('colorscheme tokyonight')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


vim.cmd('hi SignColumn ctermbg=0')
vim.cmd('set signcolumn=no')

vim.cmd('hi Pmenu ctermfg=120')
vim.cmd('hi Pmenu ctermbg=0')

vim.cmd('hi StatusLine ctermfg=0')
vim.cmd('hi StatusLine ctermbg=15')
vim.cmd('hi StatusLine cterm=reverse')

vim.opt.termguicolors = true

--allows highlighint in comments
--vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})


vim.filetype.add({
    extension = {
        src = "greyscript"
    }
})
