"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin

call plug#begin('~/.vimplugin')
"Plug in
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-obsession'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'mustache/vim-mustache-handlebars'
Plug 'kchmck/vim-coffee-script'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'junegunn/goyo.vim'
Plug 'ferrine/md-img-paste.vim'
call plug#end()

" Image Paste MD
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

set foldlevelstart=1000

" Splits open at the botoom and right
set splitbelow splitright

"PDF TEX
let g:livepreview_previewer = 'open -a Preview'

"Set mouse
set mouse=a

"Set up for windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Set up for NERDtree
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
nmap <F6> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

let mapleader=","       " leader is comma
let g:mapleader = ","

" filetype support
set nocompatible
filetype plugin indent on
filetype on
filetype indent on
runtime macros/matchit.vim

" set hidden
set hidden

" set path for finding
set path+=**

"Gundo
"nnoremap <F5> :GundoToggle<CR>

"Set forward slash for window file completation.
set shellslash


syntax on
syntax enable

"set nowrap
"set nowrap
set ai "Auto indent
set si "Smart indent

"Set status line
set number
set laststatus=2
" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"Increase search
set incsearch
"set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set tabstop=2       " number of visual spaces per TAB
set expandtab       " tabs are spaces
set shiftwidth=2

set showcmd             " show command in bottom bar

"set cursorline          " highlight current line
"hi CursorLine term=reverse ctermbg=8 guibg=DarkGrey

set wildmenu            " visual autocomplete for command menu
set wildmode=full
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]


" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/node_modules/*
endif

" For regular expressions turn magic on
set magic

" Add a bit extra margin to the left
"set foldcolumn=1


" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Be smart when using tabs ;)
set smarttab
" allows cursor change in tmux mode


" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>


" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext<cr>



" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"Set ignore file and directory
set wildignore+=*/target/*


" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()

" Search all throgh dic
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))

nnoremap <silent> <leader>o :All<cr>
nnoremap <silent> <leader>l :Lines<cr>
nnoremap <silent> <leader>k :Buffers<cr>
