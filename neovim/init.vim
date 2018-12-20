"vim plug plugins
"
call plug#begin('~/.vim/plugged')
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'flazz/vim-colorschemes'
Plug 'autozimu/LanguageClient-neovim',{
	\	'branch': 'next',
	\	'do': 'bash install.sh'
	\}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
"Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
"Plug 'ryanoasis/vim-devicons'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
"Plug '907th/vim-auto-save'
Plug 'wikitopian/hardmode'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'zchee/deoplete-jedi'
Plug 'morhetz/gruvbox'
"Plug 'davidhalter/jedi-vim'
call plug#end()
" ---------------------------------Plugin Setting---------------------------------------
" NERDTree configs
map <C-m> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"LANGUAGE SERVER
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"DEOPLETE autocomplete
let g:deoplete#enable_at_startup = 1

"VIm minimap
let g:minimap_show='<leader>ms'
let g:minimpa_update='<leader>mu'
let g:minimap_cloe='<leader>gc'
let g:minimap_toggle='<leader>gt'
" ----------------------------------------------------------------------------------
"Neovim config file
" ---------------------------- Neovim config---------------------------------
let g:loaded_python_provider = 1  
set wrap
set linebreak
set nocompatible
set encoding=utf-8
set hidden
filetype plugin indent on         
syntax on
set synmaxcol=2048

set autoindent
set smartindent
set backspace=indent,eol,start

set shiftwidth=4
set tabstop=4
set noexpandtab

set textwidth=0
set nolinebreak
set wrap


set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

nmap <silent> <Leader>/ :nohlsearch<CR>

"colorscheme settings


set relativenumber
set numberwidth=5
set ruler
set showcmd
set showmatch
set showmode
set title
set scrolloff=3
set cmdheight=1

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()



set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.swp,*.bak,*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Quickly edit/reload the vimrc file
" http://www.derekwyatt.org/vim/the-vimrc-file/my-vimrc-file/
nmap <silent> <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" navigate around in buffers...
map <Leader>n :bnext<CR>
map <Leader>p :bprevious<CR>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>

" Maps Alt-[s.v] to horizontal and vertical split respectively
map <silent> <A-s> :split<CR>
map <silent> <A-v> :vsplit<CR>

" Maps Alt-[n,p] for moving next and previous window respectively
map <silent> <A-n> <C-w><C-w>
map <silent> <A-p> <C-w><S-w>

nnoremap ;; : " ?

nmap <Leader>l :set list!<CR>               " Shortcut to rapidly toggle invisibles (`set list`)

" sudo save file
cmap w!! w !sudo tee % >/dev/null

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif


"Rainbow parenthesis

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle=0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"vim autosave settings

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_write_all_buffers = 1 

"Neomake config
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)

"Base 16scheme 
colorscheme gruvbox
set background=dark
