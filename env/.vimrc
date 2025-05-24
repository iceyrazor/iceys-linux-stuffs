" set bg=light

" ignores case in search
set ic

"Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" set to system clipboard
set clipboard=unnamedplus

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Add numbers to each line on the left-hand side.
set number relativenumber

" Turn syntax highlighting on.
syntax on

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
"set wildmode=list:longest
set wildmode=longest,list,full

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" set wrap enable
set wrap

" set tab size
set tabstop=4
set softtabstop=4
set shiftwidth=4

set encoding=utf-8

" split open at the bottem and right
set splitbelow splitright
" easier nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" supposed to map urlview. doesnt fucking work. figures
" :noremap <leader>u :w<Home>silent <End> !urlview<CR>

nnoremap S :%s//g<left><left>

nnoremap <silent> <C-t> :tabnew<CR>

" au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'>

map <S-Insert> <C-i>
vnoremap <C-c> "+y
map <C-p> "+P

" add vimrc.plug
if filereadable(expand("~.vimrc.plug"))
	source ~/.vimrc.plug
endif


" auto delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
