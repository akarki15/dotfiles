" Bundle manager
" pathogen settings. Don't exactly know what it is doing. Just copied it from http://vimawesome.com/plugin/syntastic#settings
execute pathogen#infect()
execute pathogen#helptags()
" Statusbar 

" always display statusline
 set laststatus=2
" set statusline=
" set statusline +=%1*\ %n\ %*            "buffer number
" set statusline +=%5*%{&ff}%*            "file format
" set statusline +=%3*%y%*                "file type
" set statusline +=%4*\ %<%F%*            "full path
" set statusline +=%2*%m%*                "modified flag
" set statusline +=%1*%=%5l%*             "current line
" set statusline +=%2*/%L%*               "total lines
" set statusline +=%1*%4v\ %*             "virtual column number
" set statusline +=%2*0x%04B\ %*          "character under cursor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hightlight whitespace
match ErrorMsg '\s\+$'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline configs

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
	  return expand('%:p')
  endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic check
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Use pylint to check python code
" let g:syntastic_python_checkers = ['pylint', 'python'] 
" let g:syntastic_javascript_checkers = ['jshint']
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " 
"
" Theme
syntax on
set background=light
let g:solarized_termtrans = 1
" colorscheme solarized


" set expandtab       " tabs are spaces

set number              " show line numbers
set relativenumber 	" use relative line numbers instead of absolute

set showcmd             " show command in bottom bar

"set cursorline          " highlight current line

filetype indent on      " load filetype-specific indent files

set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

inoremap jk <esc>		" jk is escape

" " " " " " " " " " " " " " " " " " " " " " " " " " " " "
" Convert tabs to 4 spaces
" set tabstop=4
" set shiftwidth=4
" set expandtab

" " " " " " " " " " " " " " " " " " " " " " " " " " " " "
" NERDTree Shortcut
map <C-n> :NERDTreeToggle<CR>

set splitbelow
set splitright
" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

set mouse=a

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Switch to alternate file
" map <C-Tab> :bnext<cr>
" map <C-S-Tab> :bprevious<cr>

" vim-go settings
" map <C->
" Highlight

filetype plugin on

" g:neocompete#enable_at_startup = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
" Set leader
let mapleader=","
"alias to go import
nnoremap <Leader>y :GoImports<CR> 

" 80 char line

" Mappings to access buffers (don't use "\p" because a
" " delay before pressing "p" would accidentally paste).
" " \l       : list buffers
" " \b \f \g : go back/forward/last-used
" " \1 \2 \3 : go to buffer 1/2/3 etc
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

au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
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

" Open current file in nerdtree
nmap <Leader>n :NERDTreeFind<CR>

" Set buffers hidden so that I can switch to another buffer without vim
" yelling at me
set hidden
" tabline settings
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

if !has('nvim')
	set ttymouse=xterm2
endif

" Mac clipboard sharing
set clipboard=unnamed

" Nerdcommenter
filetype plugin on
