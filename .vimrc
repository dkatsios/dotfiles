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
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set wildmenu            " visual autocomplete for command menu
" set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set laststatus=2

" turn off search highlight
nnoremap <Leader><space> :nohlsearch<CR>
nnoremap <Leader>v :NERDTreeToggle<CR>
map <Leader>b :buffers<CR>:buffer<Space>
map <Leader>t :tabnew<CR>

set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldlevel=99
set foldmethod=indent   " fold based on indent level
set autoindent
set splitbelow
set splitright

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed
" let python_highlight_all=1



" Packages

"" colorscheme
syntax on
if !filereadable(expand("~/.vim/colors/darcula.vim"))
        silent !mkdir -p ~/.vim/colors
        silent !wget https://raw.githubusercontent.com/blueshirts/darcula/master/colors/darcula.vim -P ~/.vim/colors/
endif
if filereadable(expand("~/.vim/colors/darcula.vim"))
        colorscheme darcula
else
        colorscheme slate
endif

"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"set rtp+=~/.vim/bundle/Vundle.vim

" Autosave
"set updatetime=1000
"let g:auto_save = 1
"let g:auto_save_events = ["CursorHold", "CursorHoldI"]
"let g:auto_save_silent = 1  " do not display the auto-save notification

"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'vim-syntastic/syntastic'

if !filereadable((expand("~/.vim/autoload/pathogen.vim")))
        silent !mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
endif
execute pathogen#infect()
filetype plugin indent on
 
if !isdirectory(expand("~/.vim/bundle/vim-flake8"))
        silent !pip install flake8
        silent !git clone https://github.com/nvie/vim-flake8.git ~/.vim/bundle/vim-flake8
endif

if !isdirectory(expand("~/.vim/bundle/jedi-vim"))
        silent ! mkdir -p ~/.vim/b
        silent !git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
endif

if !filereadable(expand("~/.config/flake8"))
        silent !mkdir -p ~/.config
        silent !echo [flake8] >> ~/.config/flake8
        silent !echo max-line-length = 120 >> ~/.config/flake8
endif

"autocmd BufWritePost *.py call Flake8()
autocmd BufWritePost *.py wincmd p
autocmd BufWritePost *.py set ft=python
"set tags=./tags,tags;$HOME
"au BufWritePost *.py silent! !ctags -R &
"set tags=tags;/
""  au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

nnoremap <space> za
autocmd StdinReadPre * let s:std_in=1

if !isdirectory(expand("~/.vim/pack/vendor/start/nerdtree/"))
        silent !git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
        silent !vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Automatic reloading of .vimrc
"autocmd! bufwritepost .vimrc source %

silent !xset r rate 250 40
