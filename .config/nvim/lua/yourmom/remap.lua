vim.g.mapleader=" "
vim.g.maplocalleader=" "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


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
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--sets leader y to put in sys clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
--paste but dont overwrite current register with selection
vim.keymap.set("v", "<leader>p", "\"_dP")

--nnoremap S :%s//g<left><left>
vim.keymap.set("n", "S", [[:%s//<Left>]])


vim.keymap.set('n', '<leader>to', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>')
vim.keymap.set('n', '<leader>tn', ':tabn<CR>')
vim.keymap.set('n', '<leader>tp', ':tabp<CR>')

vim.keymap.set('n', '<leader>lw', '<cmd>:set wrap!<CR>')

--stay in indent mode
vim.keymap.set('v', '<', '<gv', {noremap = true})
vim.keymap.set('v', '>', '>gv', {noremap = true})


--reize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>')
vim.keymap.set('n', '<Down>', ':resize +2<CR>')
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<RIght>', ':vertical resize +2<CR>')

-- window management
vim.keymap.set('n', '<leader>v', '<C-w>v')
vim.keymap.set('n', '<leader>h', '<C-w>s')
vim.keymap.set('n', '<leader>se', '<C-w>=')
vim.keymap.set('n', '<leader>xs', ':close<CR>')

-- navigate splits 
vim.keymap.set("n","<C-h>","<C-w>h")
vim.keymap.set("n","<C-j>","<C-w>j")
vim.keymap.set("n","<C-l>","<C-w>l")
vim.keymap.set("n","<C-k>","<C-w>k")



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
elseif string.find(filename,".*%.rs$") then
    cc_command="oprintln!(\"debug: {}\",);<Esc>V=$hi"
end

vim.keymap.set("n", "<leader>cc", cc_command)

local auto_close=false
local function toggle_auto_close()
    if auto_close==false then
        vim.keymap.set("i", "{", "{<CR>}<Esc>ko");
        vim.keymap.set("i", "(", "()<Esc>i");
        if string.find(filename,".*%.html$") then
            vim.keymap.set("i", "<", "<");
            vim.keymap.set("i", ">", "><Esc>T<yef>a</><Esc>hpF<i");
        else
            vim.keymap.set("i", "<", "<><Esc>i");
            vim.keymap.set("i", ">", ">");
        end
        vim.keymap.set("i", "[", "[]<Esc>i");
        vim.keymap.set("i", "\"", "\"\"<Esc>i");
        vim.keymap.set("i", "'", "''<Esc>i");
        auto_close=true
    else
        vim.keymap.set("i", "{", "{");
        vim.keymap.set("i", "(", "(");
        vim.keymap.set("i", "<", "<");
        vim.keymap.set("i", ">", ">");
        vim.keymap.set("i", "[", "[");
        auto_close=false
    end
end
toggle_auto_close()

vim.keymap.set("n", "<leader>k", toggle_auto_close)

--[[
vim.keymap("i","<Caps_Lock>", function()
	
end)
]]
