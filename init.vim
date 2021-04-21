" Leader keys {{
let mapleader = "\<Space>"
let maplocalleader = ","
" }}
" Plugins {{
call plug#begin()
Plug 'https://github.com/tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-vinegar'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/junegunn/vim-easy-align.git'

Plug 'https://github.com/907th/vim-auto-save.git'
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "CompleteDone"]

Plug 'https://github.com/junegunn/fzf.git', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim.git'

Plug 'https://github.com/scrooloose/nerdtree.git'
let NERDTreeHijackNetrw=0

Plug 'https://github.com/elzr/vim-json.git'
Plug 'https://github.com/neoclide/jsonc.vim.git'

Plug 'https://github.com/itchyny/lightline.vim.git'
" Replace filename with relative-path
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \           [ 'readonly', 'relativepath', 'modified' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'relativepath' ] ]
      \ }
      \ }

Plug 'https://github.com/morhetz/gruvbox.git'
silent! colorscheme gruvbox
call plug#end()
" }}
" Options {{
set hidden
set number relativenumber
set nohlsearch
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set sessionoptions-=options
set sessionoptions-=help
set sessionoptions-=folds
" }}
" Clipboard {{
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif
" }}
" Commands {{
command -nargs=1 SetTab setlocal tabstop=<args> shiftwidth=<args> 
            \ softtabstop=<args> expandtab
" }}
" Key mappings/bindings {{
nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>eg :edit $MYGVIMRC<CR>

nnoremap <Leader>cc :close<CR>
nnoremap <Leader>qq :confirm qall<CR>
nnoremap <Leader>ww :write<CR>

nnoremap <Leader>wc :close<CR>
nnoremap <Leader>ws :split<CR>
nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wl :wincmd l<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wT :wincmd T<CR>

nnoremap <Leader>ch :wincmd h<CR>:close<CR>
nnoremap <Leader>cl :wincmd l<CR>:close<CR>
nnoremap <Leader>cj :wincmd j<CR>:close<CR>
nnoremap <Leader>ck :wincmd k<CR>:close<CR>

nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>to :tabonly<CR>

nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gl `.
" }}
" Autocommand {{
augroup my_augroup
    autocmd!
    autocmd BufEnter * silent! normal! `.zz
    autocmd BufLeave * silent! write
    autocmd InsertEnter * normal! zz
    autocmd BufRead,BufNewFile tsconfig.json setlocal filetype=jsonc
augroup END
" }}
" Modelines
" vim:foldmethod=marker:foldmarker={{,}}
