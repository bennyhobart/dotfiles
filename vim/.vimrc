" Install Vim Plug if not installed
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
Plug 'ervandew/supertab'

" Git
Plug 'tpope/vim-fugitive'

"Project Exploration
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'

" Formatting and Filechecking
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'

" Autocompletion
Plug 'Shougo/deoplete.nvim'
Plug 'steelsojka/deoplete-flow'

" Syntax highlighting
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

" Colors
Plug 'junegunn/seoul256.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

"Set colorscheme
colo seoul256
set background=dark

set noswapfile
set number
set incsearch
set hlsearch
set laststatus=2
set autoindent
set backspace=indent,eol,start
set wildignore+=*/dist/*,*/node_modules/*,*/vendor/bundle/*,*/build/*,*/coverage/*

"tab shortcuts
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i

" Autocomplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_at_startup = 1

"" Local Flow
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif

"JS
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:javascript_continuation = 1

" Search shortcuts
nnoremap <C-s>  :Files<CR>
inoremap <C-s>  <Esc>:Files<CR>i
nnoremap gf :Ack!<space>

" Formatting shortcuts
nnoremap gp :Neoformat<cr>

" Neomake
nnoremap gm :Neomake<cr>
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_javascript_flow_exe = $PWD .'/node_modules/.bin/flow'
let g:neomake_jsx_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_jsx_flow_exe = $PWD .'/node_modules/.bin/flow'
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_jsx_enabled_makers = ['eslint', 'flow']

" Autocmds
autocmd BufWritePre * %s/\s\+$//e " trim trailing white space
autocmd! BufWritePost * Neomake  " run neomake
autocmd QuickFixCmdPost *grep* cwindow
