" Bundle manager
" pathogen settings. Don't exactly know what it is doing. Just copied it from http://vimawesome.com/plugin/syntastic#settings
execute pathogen#infect()
execute pathogen#helptags()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusbar
set laststatus=2 	" always display statusline
match ErrorMsg '\s\+$' 	" hightlight whitespace
set number              " show line numbers
set relativenumber 	" use relative line numbers instead of absolute
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
syntax on
inoremap jk <esc>	" jk is escape
set mouse=a
filetype plugin on
let mapleader=","	" Set leader
set clipboard=unnamed 	" Mac clipboard sharing
set fillchars+=vert:\ 	" Remove | from vertical divider

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

set splitbelow
set splitright

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Nerdcommenter
filetype plugin on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim
" escape from terminal
tnoremap <Esc> <C-\><C-n>

if !has('nvim')
	set ttymouse=xterm2
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Shortcut
map <C-n> :NERDTreeToggle<CR>

" Open current file in nerdtree
nmap <Leader>n :NERDTreeFind<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline configs
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bufferline
 let g:bufferline_rotate = 2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buffer nav
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>d :bd<CR>
set hidden 	" Set buffers hidden so that I can switch to another buffer without vim yelling at me
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Golang
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 0

nnoremap <Leader>c :GoErrCheck<CR>
nnoremap <Leader>a :GoAlternate<CR>
nnoremap <Leader>y :GoImports<CR>
nnoremap <Leader>t :GoTestFunc<CR>

au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
" Open the relevant Godoc for the word under the cursor with <leader>gd or open it vertically with <leader>gv
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)A

" Or open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Show type info for the word under your cursor with <leader>i (useful if you
" have disabled auto showing type info via g:go_auto_type_info)
au FileType go nmap <Leader>i <Plug>(go-info)
" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
