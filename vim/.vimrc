let g:python_host_prog = '/Users/bennyhobart/.pyenv/versions/2.7.11/envs/neovim2/bin/python'
let g:python3_host_prog = '/Users/bennyhobart/.pyenv/versions/3.4.4/envs/neovim3/bin/python'

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
Plug 'styled-components/vim-styled-components'
Plug 'hail2u/vim-css3-syntax'
Plug 'leafgarland/typescript-vim'

" Autocomplete
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neco-syntax'

" Colors
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

"Set colorscheme
colorscheme base16-default-dark

" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Change mapleader
let mapleader=","
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
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
let g:airline_theme='base16'

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
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']

"fzf
let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
