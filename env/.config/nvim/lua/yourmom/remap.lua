vim.g.mapleader=" "
vim.g.maplocalleader=" "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- notes
vim.keymap.set("n", "<leader>notes", ":e ~/stuff/notes/notes.md<CR>")

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

vim.keymap.set('n', '<leader>lw', '<cmd>:set wrap!<CR>')

--stay in indent mode
vim.keymap.set('v', '<', '<gv', {noremap = true})
vim.keymap.set('v', '>', '>gv', {noremap = true})


--reize with alt
vim.keymap.set('n', '<A-k>', ':resize -2<CR>')
vim.keymap.set('n', '<A-j>', ':resize +2<CR>')
vim.keymap.set('n', '<A-h>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<A-l>', ':vertical resize +2<CR>')

-- window management
vim.keymap.set('n', '<leader>v', '<C-w>v')
vim.keymap.set('n', '<leader>h', '<C-w>s')
vim.keymap.set('n', '<leader>se', '<C-w>=')
vim.keymap.set('n', '<leader>sx', ':close<CR>')

-- navigate splits 
vim.keymap.set("n","<C-h>","<C-w>h")
vim.keymap.set("n","<C-j>","<C-w>j")
vim.keymap.set("n","<C-l>","<C-w>l")
vim.keymap.set("n","<C-k>","<C-w>k")

-- navigate tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>')
vim.keymap.set('n', '<leader>tn', ':tabn<CR>')
vim.keymap.set('n', '<leader>tp', ':tabp<CR>')


-- make a error check thing for c
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- terminal niceites
-- vim.keymap.set("n", "<C-;>", ":", { desc = "Enter command mode" })
-- vim.keymap.set("v", "<C-;>", ":", { desc = "Enter command mode (visual)" })
vim.keymap.set("t", "<C-e>", "<C-\\><C-n>", { desc = "Exit terminal" })


--change cwd to directory of buffer or git master directory
local function set_cwd()
    local fname = vim.fn.expand("%:p")
    if not fname:find("fugitive") and not fname:find("term") then -- no dot in filename
        vim.cmd('cd ' .. vim.fn.expand('%:p:h'))

        local gitroot = vim.fn.system("git rev-parse --show-toplevel")
        if string.find(gitroot, "fatal", 1, true) == nil then
            vim.cmd("cd " .. gitroot)
        end
    end
end

vim.keymap.set("n", "<leader>c", set_cwd, {})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*",
    callback = set_cwd
})

-- auto closing para
local function set_auto_close(doclose)
    if doclose==true then
        vim.keymap.set("i", "{", "{<CR>}<Esc>ko");
        vim.keymap.set("i", "(", "()<Esc>i");
        local filename = vim.api.nvim_buf_get_name(0)
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
    else
        vim.keymap.set("i", "{", "{");
        vim.keymap.set("i", "(", "(");
        vim.keymap.set("i", "<", "<");
        vim.keymap.set("i", ">", ">");
        vim.keymap.set("i", "[", "[");
        vim.keymap.set("i", "\"", "\"");
        vim.keymap.set("i", "'", "'");
    end
end
set_auto_close(true)


local auto_close=true
local function toggle_auto_close()
    if auto_close==true then
        auto_close=false
    else
        auto_close=true
    end
    set_auto_close(auto_close)
end

vim.keymap.set("n", "<leader>k", toggle_auto_close)

-- update every buffer
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  pattern = "*",
  callback = function()
      --per file type log quick binds
      local cc_command=""
      local filename = vim.api.nvim_buf_get_name(0)

      set_auto_close(auto_close)

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
  end
})

-- colemak rebinds
local colemak_switch=false

local colemak_tog = function()
    if colemak_switch==true then
        colemak_switch=false
        vim.keymap.set("n","d","d")
        vim.keymap.set("n","e","e")
        vim.keymap.set("n","f","f")
        vim.keymap.set("n","g","g")
        vim.keymap.set("n","i","i")
        vim.keymap.set("n","j","j")
        vim.keymap.set("n","k","k")
        vim.keymap.set("n","l","l")
        vim.keymap.set("n","n","n")
        vim.keymap.set("n","o","o")
        vim.keymap.set("n","p","p")
        vim.keymap.set("n","r","r")
        vim.keymap.set("n","s","s")
        vim.keymap.set("n","t","t")
        vim.keymap.set("n","u","u")
        vim.keymap.set("n","y","y")
        vim.keymap.set("n","D","D")
        vim.keymap.set("n","E","E")
        vim.keymap.set("n","F","F")
        vim.keymap.set("n","G","G")
        vim.keymap.set("n","I","I")
        vim.keymap.set("n","J","J")
        vim.keymap.set("n","K","K")
        vim.keymap.set("n","L","L")
        vim.keymap.set("n","N","N")
        vim.keymap.set("n","O","O")
        vim.keymap.set("n","P","P")
        vim.keymap.set("n","R","R")
        vim.keymap.set("n","S","S")
        vim.keymap.set("n","T","T")
        vim.keymap.set("n","U","U")
        vim.keymap.set("n","Y","Y")

        vim.keymap.set("v","d","d")
        vim.keymap.set("v","e","e")
        vim.keymap.set("v","f","f")
        vim.keymap.set("v","g","g")
        vim.keymap.set("v","i","i")
        vim.keymap.set("v","j","j")
        vim.keymap.set("v","k","k")
        vim.keymap.set("v","l","l")
        vim.keymap.set("v","n","n")
        vim.keymap.set("v","o","o")
        vim.keymap.set("v","p","p")
        vim.keymap.set("v","r","r")
        vim.keymap.set("v","s","s")
        vim.keymap.set("v","t","t")
        vim.keymap.set("v","u","u")
        vim.keymap.set("v","y","y")
        vim.keymap.set("v","D","D")
        vim.keymap.set("v","E","E")
        vim.keymap.set("v","F","F")
        vim.keymap.set("v","G","G")
        vim.keymap.set("v","I","I")
        vim.keymap.set("v","J","J")
        vim.keymap.set("v","K","K")
        vim.keymap.set("v","L","L")
        vim.keymap.set("v","N","N")
        vim.keymap.set("v","O","O")
        vim.keymap.set("v","P","P")
        vim.keymap.set("v","R","R")
        vim.keymap.set("v","S","S")
        vim.keymap.set("v","T","T")
        vim.keymap.set("v","U","U")
        vim.keymap.set("v","Y","Y")
    else
        colemak_switch=true
        vim.keymap.set("n","d","g")
        vim.keymap.set("n","e","k")
        vim.keymap.set("n","f","e")
        vim.keymap.set("n","g","t")
        vim.keymap.set("n","i","l")
        vim.keymap.set("n","j","y")
        vim.keymap.set("n","k","n")
        vim.keymap.set("n","l","u")
        vim.keymap.set("n","n","j")
        vim.keymap.set("n","o","p")
        vim.keymap.set("n","p","r")
        vim.keymap.set("n","r","s")
        vim.keymap.set("n","s","d")
        vim.keymap.set("n","t","f")
        vim.keymap.set("n","u","i")
        vim.keymap.set("n","y","o")
        vim.keymap.set("n","D","G")
        vim.keymap.set("n","E","K")
        vim.keymap.set("n","F","E")
        vim.keymap.set("n","G","T")
        vim.keymap.set("n","I","L")
        vim.keymap.set("n","J","Y")
        vim.keymap.set("n","K","N")
        vim.keymap.set("n","L","U")
        vim.keymap.set("n","N","J")
        vim.keymap.set("n","O","P")
        vim.keymap.set("n","P","R")
        vim.keymap.set("n","R","S")
        vim.keymap.set("n","S","D")
        vim.keymap.set("n","T","F")
        vim.keymap.set("n","U","I")
        vim.keymap.set("n","Y","O")

        vim.keymap.set("v","d","g")
        vim.keymap.set("v","e","k")
        vim.keymap.set("v","f","e")
        vim.keymap.set("v","g","t")
        vim.keymap.set("v","i","l")
        vim.keymap.set("v","j","y")
        vim.keymap.set("v","k","n")
        vim.keymap.set("v","l","u")
        vim.keymap.set("v","n","j")
        vim.keymap.set("v","o","p")
        vim.keymap.set("v","p","r")
        vim.keymap.set("v","r","s")
        vim.keymap.set("v","s","d")
        vim.keymap.set("v","t","f")
        vim.keymap.set("v","u","i")
        vim.keymap.set("v","y","o")
        vim.keymap.set("v","D","G")
        vim.keymap.set("v","E","K")
        vim.keymap.set("v","F","E")
        vim.keymap.set("v","G","T")
        vim.keymap.set("v","I","L")
        vim.keymap.set("v","J","Y")
        vim.keymap.set("v","K","N")
        vim.keymap.set("v","L","U")
        vim.keymap.set("v","N","J")
        vim.keymap.set("v","O","P")
        vim.keymap.set("v","P","R")
        vim.keymap.set("v","R","S")
        vim.keymap.set("v","S","D")
        vim.keymap.set("v","T","F")
        vim.keymap.set("v","U","I")
        vim.keymap.set("v","Y","O")
    end
end

vim.keymap.set("n", "<leader>r", colemak_tog)
