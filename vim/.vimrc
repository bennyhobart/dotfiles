set nocompatible
filetype off
set rtp+=~/.vim/vundle/
let mapleader = ","
call vundle#rc()
Plugin 'gmarik/vundle'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'

Plugin 'ervandew/supertab'

Plugin 'airblade/vim-gitgutter'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'steelsojka/deoplete-flow'
Plugin 'justinmk/vim-sneak'

Plugin 'pangloss/vim-javascript'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jparise/vim-graphql'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'rking/ag.vim'
Plugin 'sbdchd/neoformat'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'

Plugin 'neomake/neomake'

" Snippets.
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'easymotion/vim-easymotion'
Plugin 'thinca/vim-localrc'

" Autocomplete
call deoplete#enable()
let g:deoplete#sources#flow#flow_bin = 'flow'
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

" local flow
let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif

"Set colorscheme
colorscheme base16-default-dark


set noswapfile
set number

" Plugins config
"ctrl p ignore
set wildignore+=*/dist/*,*/node_modules/*,*/vendor/bundle/*,*/build/*,*/coverage/*     " MacOSX/Linux

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{fugitive#statusline()}
set statusline+=%-10.3n
set statusline+=%*

"tabs
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i

" deoplete completions
let g:deoplete#enable_at_startup = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"JS Highlighting
let g:jsx_ext_required = 0

"JsDOC
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1

"multi cursors
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_next_key = '<C-d>'

"code folding
let g:javascript_continuation = 1
let g:javascript_plugin_flow = 1
"
" trim trailing white space on save
autocmd BufWritePre * %s/\s\+$//e

" NerdTree
let NERDTreeShowHidden=1

" ctrlp
let g:ctrlp_show_hidden = 1

" formatting
nnoremap gp :Neoformat prettiereslint<cr>

" filenames for closetags
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js"

let g:sneak#label = 1

" neomake
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_javascript_flow_exe = $PWD .'/node_modules/.bin/flow'
let g:neomake_jsx_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_jsx_flow_exe = $PWD .'/node_modules/.bin/flow'

let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_jsx_enabled_makers = ['eslint', 'flow']
autocmd BufWritePost * Neomake
