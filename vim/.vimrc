set nocompatible
filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mattn/emmet-vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'
Bundle 'chriskempson/base16-vim'
Bundle 'mxw/vim-jsx'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-unimpaired'
" Bundle 'kylef/apiblueprint.vim'
Bundle 'lambdatoast/elm.vim'
Bundle 'tpope/vim-repeat'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'heavenshell/vim-jsdoc'
Bundle 'ternjs/tern_for_vim'

"Set colorscheme
colorscheme base16-default
set background=dark

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set tabstop=4
set shiftwidth=4
set expandtab
set nrformats-=octal
set shiftround
set ttimeout
set ttimeoutlen=50
set incsearch
set laststatus=2
set ruler
set showcmd
set wildmenu
set autoread
set encoding=utf-8
set listchars=tab:▒░,trail:▓
set list
set number
set hlsearch
set ignorecase
set smartcase

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" do not history when leavy buffer
set hidden

set fileformats=unix,dos,mac

set completeopt=menuone,longest,preview

"
" Plugins config
"

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/bower_components/*,*/typings/*

" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i

let mapleader = ','
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Set javascript checker
let g:syntastic_javascript_checkers = ['eslint']

" Tern
set omnifunc=syntaxcomplete#Complete
let g:tern_map_keys=1
let g:tern_show_argument_hints="on_hold"

"JS Highlighting
let g:javascript_enable_domhtmlcss=1

"JsDOC
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1
