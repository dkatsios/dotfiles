set nocompatible              " required
filetype off                  " required

" Rebind <Leader> key
let mapleader=","

set shell=bash
"set nobackup

" Maps

" bind Ctrl+<movement> keys to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
nnoremap <leader>n <esc>:tabprevious<CR>
nnoremap <leader>m <esc>:tabnext<CR>

" change to alternative buffer
nnoremap <leader>z <esc>:b #<CR>

" add line before/after without entering insert mode
nmap <leader><CR> O<Esc>j
nmap <CR> o<Esc>k

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " beter indentation

map <c-_> <esc>:s/^/# /<CR><esc><leader><space>j

" use // to copy (yank) visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

set encoding=utf-8
set modifiable
set number              " show line numbers
set tw=80               " width of document
set nowrap              " don't automatically wrap on load
set fo-=t               " don't automatically wrap text when typing
" set colorcolumn=80
" highlight ColorColumn ctermbg=233
set showcmd             " show command in bottom bar

" Mouse
set mouse=a
set bs=2            " make backspace behave like normal again

set hidden
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set laststatus=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'doums/darcula'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'nvie/vim-flake8'
Plugin 'Townk/vim-autoclose'
Plugin 'python-mode/python-mode'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'jmcantrell/vim-virtualenv'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plugin 'tpope/vim-fugitive'

" ...
 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Color scheme
syntax on
colorscheme darcula
set termguicolors
let g:lightline = { 'colorscheme': 'darculaOriginal' }

" turn off search highlight
nnoremap <Leader><space> :nohlsearch<CR>
map <Leader>v :NERDTreeTabsToggle<CR>
map <Leader>b :buffers<CR>:buffer<Space>
map <Leader>t :tabnew<CR>
map <Leader>q : <esc><c-w>j:q<CR>

set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldlevel=99
set foldmethod=indent   " fold based on indent level
set splitbelow
set splitright

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed
let python_highlight_all=1

" Enable folding with the spacebar
nnoremap <space> za
autocmd StdinReadPre * let s:std_in=1

let g:SimpylFold_docstring_preview=1

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" let g:ycm_python_binary_path = 'python'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

silent !xset r rate 250 40

autocmd BufWritePost *.py wincmd p
autocmd BufWritePost *.py set ft=python

" pymode settings
let g:pymode_rope = 1
set completeopt=menuone,noinsert
let g:pymode_rope_goto_definition_bind = '<C-c>g'

let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Space>'

let g:pymode_lint_on_write = 0
let g:pymode_lint_unmodified = 0
let g:pymode_options_max_line_length = 120
let g:pymode_run = 0
let g:pymode_breakpoint = 0
let g:pymode_lint_ignore = ["E402"]
map <Leader>c :PymodeLint<CR>
