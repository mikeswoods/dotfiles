" A minimal vimrc for new vim users to start with.
"
" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
"
" Original Author:       Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Modified by :          Ben McCormick
" Last change:           2014 June 8
"
" To use it, copy it to
"  for Unix based systems (including OSX and Linux):  ~/.vimrc
"  for Windows :  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

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
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'JamshedVesuna/vim-markdown-preview'
Bundle 'ntpeters/vim-better-whitespace'
Plugin 'Valloric/YouCompleteMe'

" +++++++++++++++++++++++++
" Config for bundles:
"
" === YouCompleteMe ===
let g:ycm_python_binary_path = '/usr/local/bin/python'

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

" ... unless they contain at least one capital letter
set smartcase

" Set the title of the window to the working directory:
if has('gui_running')
  set guitablabel=(%N)\ %t\ %M
endif

" Backup stuff
set backup " enable backups
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

" Dark solarized + molokai
set background=dark
" solarized options
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" Markdown generation options:
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1

" NERDTree
let NERDTreeShowLineNumbers = 1
autocmd FileType nerdtree setlocal relativenumber
" The following two options make it work well with vinegar.vim
let NERDTreeHijackNetrw = 1
let g:NERDTreeMapUpdir="-"

" Clear highlighting after pressing esc
"nnoremap <esc> :noh<return><esc>

