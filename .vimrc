" Bundle manager 
" pathogen settings. Don't exactly know what it is doing. Just copied it from http://vimawesome.com/plugin/syntastic#settings
execute pathogen#infect() 
execute pathogen#helptags()
" Statusbar 

" set statusline=%t       "tail of the filename
" set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
" set statusline+=%{&ff}] "file format
" set statusline+=%h      "help file flag
" set statusline+=%m      "modified flag
" set statusline+=%r      "read only flag
" set statusline+=%y      "filetype
" set statusline+=%=      "left/right separator
" set statusline+=%c,     "cursor column
" set statusline+=%l/%L   "cursor line/total lines
" set statusline+=\ %P    "percent through file
       
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Use pylint to check python code
let g:syntastic_python_checkers = ['pylint', 'python'] 
let g:syntastic_javascript_checkers = ['jshint']

" Toggle Syntastic Error Panel


" " " " " " " " " " " " " " " " " " " " " " " " " " " " " 
" UI
syntax enable           " enable syntax processing

" Theme
set background=light
let g:solarized_termcolors = 256 
colorscheme solarized " awesome colorscheme

" set expandtab       " tabs are spaces
 
set number              " show line numbers

set showcmd             " show command in bottom bar

set cursorline          " highlight current line

filetype indent on      " load filetype-specific indent files

set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

inoremap jk <esc>		" jk is escape

" Convert tabs to 4 spaces
" set tabstop=4
" set shiftwidth=4
" set expandtab

" NERDTree Shortcut
map <C-n> :NERDTreeToggle<CR>
" Save shortcut 
nmap <C-s> :w <CR>
imap <C-s> <esc>:w <CR>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

