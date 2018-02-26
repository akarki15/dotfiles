" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
set laststatus=2                " always show statusbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
match ErrorMsg '\s\+$' 	" hightlight whitespace
set number              " show line numbers
set relativenumber 	" use relative line numbers instead of absolute
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
syntax on
set wrap! 		" turn off wrapping
"highlight Comment cterm=italic " italicize comments
let mapleader=","	" Set leader
set clipboard=unnamed 	" Mac clipboard sharing
set fillchars+=vert:\ 	" Remove | from vertical divider
" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
" disable the preview window feature.
set completeopt-=preview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdcommenter
filetype plugin on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Explorer
let g:netrw_banner = 0
nnoremap <Leader>n :Ex<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
nnoremap <Leader>p :Buffers<CR>
map <c-p> :FZF<cr>
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
" Set buffers hidden so that I can switch to another buffer without vim
" yelling at me
set hidden
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
" By default the testing commands run asynchronously in the background and
" display results with go#jobcontrol#Statusline(). To make them run in a new
" terminal
let g:go_term_enabled = 1

nnoremap <Leader>c :GoErrCheck<CR>
nnoremap <Leader>a :GoAlternate<CR>
nnoremap <Leader>t :GoTestFunc<CR>
nnoremap <Leader>i :GoInfo<CR>

au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
" Open the relevant Godoc for the word under the cursor with <leader>gd or
" open it vertically with <leader>gv
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
" snippets
iab Test_ func Test_ (t *testing.T){<CR>}
iab tRun testCases := []struct{<CR>name string<CR>}{<CR>{},<CR>}<CR> for _, tc := range testCases{<CR>t.Run(tc.name, func(t *testing.T){<CR>})<CR>}
iab ifer if err != nil {<CR> return err<CR>}<CR>
