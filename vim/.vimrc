" ~~~~ Mike Woods .vimrc ~~~~
"
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set leader to space
let mapleader = "\<Space>"

" ~~~~ Vundle shit ~~~~
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ++++ PLUGINS GO HERE ++++

Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mileszs/ack.vim'
Plugin 'junegunn/fzf.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'ntpeters/vim-better-whitespace'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'qpkorr/vim-bufkill'
Plugin 'tomtom/tcomment_vim'

" +++++++++++++++++++++++++
" Config for bundles:
"
" === YouCompleteMe ===
"let g:ycm_python_binary_path = '/usr/local/bin/python'

" +++++++++++++++++++++++++

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" -------------------------

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers
set number

" Set relative line number
set relativenumber

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Don't wrap lines by default
set nowrap

" Show the ruler
set ruler

" Show the column marker at 80 chars
set colorcolumn=80

" Number of visual spaces per TAB
set tabstop=2

" Number of spaces to use for (auto)indent step
set shiftwidth=2

" Add full file path to your existing statusline
set statusline+=%F

" Tabs are spaces
set expandtab

" Highlight current line
set cursorline

" What font do I want?
set guifont=Monaco:h14

" highlight matches
set hlsearch

" incremental searching
set incsearch

" searches are case insensitive...
set ignorecase

" clear highlighted search matches
nnoremap <leader><space> :nohlsearch<CR>

" ... unless they contain at least one capital letter
set smartcase

" show matching braces and brackets
set showmatch

" enable wildmenu"
set wildmenu
set wildignorecase
set wildmode=full

" === JS-syntax related ======================================================   

" Enables syntax highlighting for Flow.
let g:javascript_plugin_flow = 1

" === Buffer-related =========================================================

" Mac option+(1..0) -> buffer 1..10
map <D-1>: b1<CR>
map <D-2> :b2<CR>
map <D-3> :b3<CR>
map <D-4> :b4<CR>
map <D-5> :b5<CR>
map <D-6> :b6<CR>
map <D-7> :b7<CR>
map <D-8> :b8<CR>
map <D-9> :b9<CR>
map <D-0> :b10<CR>
map <D-[> :bprev<CR>
map <D-]> :bnext<CR>
map <D-\> :buffers<CR>

" Kill the current buffer with ctrl+c
map <C-c> :BD!<cr>

" Create a new, unnamed buffer with ctrl+b
map <C-b> :enew<cr>

" Open $MYVIMRC for editing:
map <silent> <leader>ev :e $MYVIMRC<cr>

" Reload $MYVIMRC

map <silent> <leader>rv :so $MYVIMRC<cr>

" === Disable Command-z for undo
map <D-Z> <nop>
imap <D-Z> <nop>

" === Arrow keys =============================================================

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" === Display & status =======================================================

" Set the title of the window to the working directory:
if has('gui_running')
  set guitablabel=(%N)\ %t\ %M
endif

" === Backup & history & undo-related ========================================

set history=1000
set undolevels=1000

set nobackup
set noswapfile

set undodir=~/.nvim-tmp/undo//     " undo files
set backupdir=~/.nvim-tmp/backup// " backups
set directory=~/.nvim-tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" === Theme ==================================================================

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Dark solarized + molokai
set background=dark
" solarized options
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" === Markdown ===============================================================

" Markdown generation options:
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1

" Strip whitespace on save
autocmd FileType javascript autocmd BufWritePre <buffer> StripWhitespace

" == fzf =====================================================================

" Point to the fzf homebrew installation:
set rtp+=/usr/local/opt/fzf

" Bind ctrl+p to fzf's :Files command
map <C-p> :Files<CR>

" ===  NERDTree ==============================================================

let NERDTreeShowLineNumbers = 1
autocmd FileType nerdtree setlocal relativenumber

" The following two options make it work well with vinegar.vim
let NERDTreeHijackNetrw = 1
let g:NERDTreeMapUpdir = "-"
let g:NERDTreeWinSize = 40
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Map NERDTree to ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Auto-open NERDTree when vim starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Clear highlighting after pressing esc
"nnoremap <esc> :noh<return><esc>

" Show bookmarks
" let g:NERDTreeShowBookmarks=1

" Show hidden files
let g:NERDTreeShowFiles=1

" === vim-airline ===========================================================

" Enable vim-airline
let g:airline#extensions#tabline#enabled=1

" Show the buffer number next to the name:
let g:airline#extensions#tabline#buffer_nr_show=1

