require("yourmom.remap")

vim.opt.guicursor=""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent=true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50
--vim.opt.colorcolumn = "80"


vim.cmd('hi SignColumn ctermbg=0')
vim.cmd('set signcolumn=no')

vim.cmd('hi Pmenu ctermfg=120')
vim.cmd('hi Pmenu ctermbg=0')
