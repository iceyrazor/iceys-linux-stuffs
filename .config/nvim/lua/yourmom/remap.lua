vim.g.mapleader=" "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) 


--[[
vim.keymap.set("n","<C-h>","<C-g>h")
vim.keymap.set("n","<C-j>","<C-w>j")
vim.keymap.set("n","<C-l>","<C-w>l")
vim.keymap.set("n","<C-k>","<C-w>k")
]]--


--[[vim.cmd[[
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'>
]]


--move highlighted stuffs
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--keeps cursor at cur pos when stacking lines to single line
vim.keymap.set("n", "J", "mzJ`z")
--keeps cursur in middle with up down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--sets leader y to put in sys clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

--nnoremap S :%s//g<left><left>
vim.keymap.set("n", "S", [[:%s//<Left>]])

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

--per file type log quick binds
local cc_command=""
local filename = vim.api.nvim_buf_get_name(0)

if string.find(filename,".*%.js$") then
    cc_command="oconsole.log();<Esc>V=$hi"
elseif string.find(filename,".*%.lua$") then
    cc_command="oterm.print()<Esc>V=$i"
elseif string.find(filename,".*%.c$") then
    cc_command="oprintf(\"debug: %i\",);<Esc>V=$hi"
end

vim.keymap.set("n", "<leader>cc", cc_command)


--[[
vim.keymap("i","<Caps_Lock>", function()
	
end)
]]
