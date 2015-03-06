" Set language
set langmenu=en_US.UTF-8
let $LANG = 'en_US.UTF-8'

" Plugins
" Manage runtimepath.(https://github.com/tpope/vim-pathogen)
execute pathogen#infect()

" Backup
set backupdir=~/vimfiles/tmp,. " Backup files folder.
set directory=~/vimfiles/tmp,. " Swap files folder.

" Store session
map <F2> :mksession! ~/vimfiles/tmp/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vimfiles/tmp/vim_session <cr>     " Load session with F3

" Editor
set shiftwidth=4	" Shift width.
set tabstop=4		" Set tabsize.
set autoindent		" Copy indent from current line when starting a new line.
set smartindent		" Automatically inserts one extra level of indentation in some cases, and works for C-like files.
set incsearch		" Do incremental searching.
set number			" Set line numbers.
set laststatus=2	" Always display the status line.
set ruler			" Show the cursor position all the time.

set history=50
set noswapfile

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif
