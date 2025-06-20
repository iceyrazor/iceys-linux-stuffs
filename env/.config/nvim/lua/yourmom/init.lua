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
--vim.cmd('colorscheme tokyonight')
vim.cmd('colorscheme eldritch')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


vim.cmd('hi SignColumn ctermbg=0')

vim.cmd('hi Pmenu ctermfg=120')
vim.cmd('hi Pmenu ctermbg=0')

vim.cmd('hi StatusLine ctermfg=0')
vim.cmd('hi StatusLine ctermbg=15')
vim.cmd('hi StatusLine cterm=reverse')

vim.opt.termguicolors = true

--allows highlighint in comments
--vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})


-- make no file extension go to sh type
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*",
  callback = function()
    local fname = vim.fn.expand("%:t")
    if not fname:find("%.") then -- no dot in filename
      vim.bo.filetype = "sh"
    end
  end
})
