set nocompatible

call plug#begin('~/.vim/plugged')
"TODO: add vim-plug as a git submodule
"Plug 'user/repo' < for github
"add: (for c, make sure it goes to the ftplugins)
"Example:
"Plug 'scrooloose/nerdtree', { 'for': 'c' }
"tagbar
"taglist
"      jump-to definition for tags, other keybinds for tags
"      turn easytags off unless filetype is c
"      or Autotag...?
"'
call plug#end

set t_Co=256
syntax enable
colorscheme rcr
filetype plugin indent on

set backup
set writebackup
set backupdir=$HOME/.vim/tmp
set directory=$HOME/.vim/tmp
set viminfo+=n$HOME/.vim/viminfo

set autochdir
set autoindent
set backspace=2
set cul
set fillchars=fold:-
set gdefault
set hlsearch
set ignorecase
set incsearch
set lazyredraw
set list
set listchars=tab:>\ ,trail:-
set nu
set scrolloff=3
set shortmess=atIO
set smartcase
set splitbelow
set sw=4 ts=4 sts=4
set title

set laststatus=2
set statusline=\ %F      "Absolute file path
set statusline+=\ :\ %L  "Number of lines in buffer
set statusline+=\ %p%%   "Percentage through file
set statusline+=\ %02.3c "Column number
set statusline+=\ %M     "Modified flag
set statusline+=\ %r     "Read only flag

augroup search_stuff
    au InsertLeave * :setlocal hlsearch
    au InsertEnter * :setlocal nohlsearch
augroup END

let mapleader = ","

cnoremap s!! mksession! $HOME/.vim/session.vim<CR>
cnoremap w!! %!sudo tee > /dev/null %<CR>
inoremap jj <Esc>
nnoremap ' `
nnoremap . .`[
nnoremap ; :
nnoremap <CR> :noh<Return><Esc>
nnoremap <F8> :setlocal spell! spelllang=en_us<CR>
nnoremap <Leader><Space> :wincmd L<CR>
nnoremap <Leader>s :Vex!<CR>
nnoremap <Leader>t :Tex<CR>
nnoremap <Space> i_<Esc>r
nnoremap gs <nop>
nnoremap gt <nop>
nnoremap j gj
nnoremap k gk
noremap <C-h> :wincmd W<CR>
noremap <C-j> :tabn<CR>
noremap <C-k> :tabp<CR>
noremap <C-l> :wincmd w<CR>

augroup python_stuff
    au!
    au FileType python inoremap // # 
    au FileType python set expandtab
augroup END

augroup c_stuff
    au!
    au FileType c inoremap // //
    au FileType c inoremap /* /*  */<Esc>2<Left>i
    au FileType c inoremap {<CR> {<CR>}<Esc>O
    au FileType c set smartindent
augroup END

let g:netrw_list_hide='.*\.o$,.*\.pyc$'
let g:netrw_winsize=""
