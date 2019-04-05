if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

"Plugins
call plug#begin('~/.local/share/nvim/plugged')
" Motions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

" Git
Plug 'tpope/vim-fugitive'

"Project Exploration
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'

" Formatting and Filechecking
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'w0rp/ale'
Plug 'JamshedVesuna/vim-markdown-preview'

" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'leafgarland/typescript-vim'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neco-syntax'

" Colors
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
call plug#end()

"Set colorscheme
colorscheme nord

" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Change mapleader
let mapleader=","
" Respect modeline in files
set modeline
set modelines=4
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Indent auto
set autoindent
" ignore certain directories
set wildignore+=*/dist/*,*/node_modules/*,*/vendor/bundle/*,*/build/*,*/coverage/*
" autocomplete
set omnifunc=syntaxcomplete#Complete

"tab shortcuts
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
set completeopt-=preview


" Ultisnips
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
let g:UltiSnipsExpandTrigger="<C-s>"

" Statusline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#ale#enabled = 1

"JS
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

" Search shortcuts
nnoremap <C-p>  :Files<CR>
inoremap <C-p>  <Esc>:Files<CR>i
nnoremap <Leader>f :Ack!<space>

" History + Git
nnoremap gb :BCommits<CR>
nnoremap gh :History<CR>
nnoremap gs :GFiles?<CR>

" Fix
let g:ale_fix_on_save = 1
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}


"fzf
let g:fzf_buffers_jump = 1

" NERDTree
let NERDTreeShowHidden=1
