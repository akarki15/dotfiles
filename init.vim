" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/scrooloose/nerdtree'
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/bling/vim-bufferline'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'https://github.com/tpope/vim-surround'

" Rust-specific
Plug 'sebastianmarkow/deoplete-rust'
Plug 'rust-lang/rust.vim'
let g:deoplete#sources#rust#racer_binary='/Users/aashishkarki/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/aashishkarki/rust/rust-source/rust/src'

" Initialize plugin system
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusbar
set laststatus=2 			" always display statusline
"set showcmd             		" show command in bottom bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bufferline
let g:bufferline_rotate = 2
"let g:bufferline_echo = 0
"autocmd VimEnter *  let &statusline='%{bufferline#refresh_status()}' .bufferline#get_status_string()
" The function refresh_status() returns an empty string and only exists to
" populate some global variables.  Since it is inside an %{} block, the
" variables will get updated whenever the statusline needs to be drawn.
" get_status_string() creates a string which references these variables.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent on      " load filetype-specific indent files
match ErrorMsg '\s\+$' 	" hightlight whitespace
set number              " show line numbers
set relativenumber 	" use relative line numbers instead of absolute
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
syntax on
highlight Comment cterm=italic " italicize comments
inoremap jk <esc>	" jk is escape
set mouse=a
filetype plugin on
let mapleader=","	" Set leader
set clipboard=unnamed 	" Mac clipboard sharing
set fillchars+=vert:\ 	" Remove | from vertical divider
highlight Pmenu ctermbg=238 gui=bold " Autocompletion color
" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

set splitbelow
set splitright

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Nerdcommenter
filetype plugin on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim
" escape from terminal
" tnoremap <Esc> <C-\><C-n>
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
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
	let name = ""
	let subs = split(expand('%'), "/") 
	let i = 1
	for s in subs
		let parent = name
		if  i == len(subs)
			let name = parent . '/' . s
		elseif i == 1
			let name = s
		else
			let name = parent . '/' . strpart(s, 0, 2)
		endif
		let i += 1
	endfor
  return name
endfunction
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
" By default the testing commands run asynchronously in the background and display results with go#jobcontrol#Statusline(). To make them run in a new terminal
let g:go_term_enabled = 1

nnoremap <Leader>c :GoErrCheck<CR>
nnoremap <Leader>a :GoAlternate<CR>
nnoremap <Leader>y :GoImports<CR>
nnoremap <Leader>t :GoTestFunc<CR>
nnoremap <Leader>p :CtrlPBuffer<CR>
nnoremap <Leader>i :GoInfo<CR>

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

" gitgutter
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
