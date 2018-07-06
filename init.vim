" :PlugInstall :PlugStatus :PlugUpgrade :PlugUpdate
call plug#begin($XDG_DATA_HOME . '/nvim/plugged')
	Plug 'airblade/vim-gitgutter'
	Plug 'junegunn/fzf', { 'dir': $XDG_DATA_HOME . '/fzf', 'do': './install --bin' }
	Plug 'junegunn/fzf.vim'
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'tpope/vim-fugitive', { 'on': ['Gblame'] }
call plug#end()

let g:gutentags_ctags_exclude = ['bld']
let g:gutentags_projcet_root = ['.git']
let g:gutentags_exclude_project_root = ['$HOME']

"TODO: config gitguter

" TODO: enew, -tabnew, etc
"
let g:fzf_buffers_jump = 1
"let g:fzf_layout = { 'window': '15split tabnew' }
"let g:fzf_layout = { 'window': 'vsplit' }
let g:fzf_layout = { 'window': '15split -tabnew' }

" TODO: folding?

syntax enable
"colorscheme rcr
filetype plugin indent on

set nobackup
set nowritebackup
set backupdir=$XDG_DATA_HOME/nvim/tmp
set directory=$XDG_DATA_HOME/nvim/tmp
set viminfo+=n$XDG_DATA_HOME/nvim/viminfo

set autochdir
set autoindent
set backspace=2
set cursorline
set fillchars=fold:-
set gdefault
set hlsearch
set ignorecase
set incsearch
set lazyredraw
set list
set listchars=tab:>\ ,trail:-
set number
set scrolloff=3
set shortmess=atIO
set signcolumn=yes
set smartcase
set splitbelow
set sw=4 ts=4 sts=4
set title
set updatetime=100
set wildmenu

let mapleader = " "
" TODO: space,space  as toggle fold? "za"
" foldmethod for c functions?jk
nnoremap <Leader><Space> :GFiles<CR>
nnoremap <Leader>b :Gblame<CR>

" TODO: not very useful? or learn commands here
nnoremap <Leader>c :Commits<CR>
nnoremap <Leader>s :Vex!<CR>
nnoremap <Leader>t :Tex<CR>


set laststatus=2
set statusline=\ %F      "Absolute file path
set statusline+=\ :\ %L  "Number of lines in buffer
set statusline+=\ %p%%   "Percentage through file
set statusline+=\ %02.3c "Column number
set statusline+=\ %M     "Modified flag
set statusline+=\ %r     "Read only flag
set statusline+=%{gutentags#statusline()}

cnoremap s!! mksession! $XDG_DATA_HOME/nvim/session<CR>
cnoremap w!! %!sudo tee > /dev/null %<CR>
inoremap jj <Esc>
nnoremap ' `
nnoremap . .`[
nnoremap ; :
nnoremap <CR> za<CR>:noh<Return><Esc>
nnoremap <F8> :setlocal spell! spelllang=en_us<CR>
nnoremap gs <nop>
nnoremap gt <nop>
nnoremap j gj
nnoremap k gk
noremap <C-h> :wincmd W<CR>
noremap <C-j> :tabn<CR>
noremap <C-k> :tabp<CR>
noremap <C-l> :wincmd w<CR>

au BufReadPost * if line("'\"") <= line("$") | exe "normal! g'\"" | endif
au InsertEnter * :setlocal nohlsearch
au InsertLeave * :setlocal hlsearch
au VimResized * wincmd =

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
	au FileType c noremap <leader>a :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
	au FileType c set smartindent
	au FileType c set foldmethod=syntax
	au FileType c set foldnestmax=1
augroup END
