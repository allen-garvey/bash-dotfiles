" GENERAL
" Indent automatically depending on filetype
filetype indent on
set autoindent

" Turn on line numbering. Turn it off with "set nonu" 
set number

" Set syntax on
syntax on

" Enable use of the mouse for all modes
set mouse=a

" Wrap text instead of being on one line
set lbr

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Change colorscheme from default to delek
colorscheme delek


" TABS
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

" UI stuff
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.

"COMMAND MENU
set showmatch           " highlight matching [{()}]
set wildmenu            " visual autocomplete for command menu
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" SEARCHING
set ignorecase
set smartcase 			" Use case insensitive search, except when using capital letters
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" ERRORS
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" KEY REMAPPING
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$