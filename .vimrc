" Set language
set langmenu=en_US.UTF-8
let $LANG = 'en_US.UTF-8'

"Backup
set backupdir=~/vimtmp,. " Backup files folder.
set directory=~/vimtmp,. " Swap files folder.
set noswapfile

set shiftwidth=4	" Shift width.
set number		" Set line numbers.
set autoindent		" Copy indent from current line when starting a new line.
set smartindent		" Automatically inserts one extra level of indentation in some cases, and works for C-like files.
set history=50
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching
set laststatus=2	" Always display the status line

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Mapping
map <F2> :mksession! ~/vimtmp/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vimtmp/vim_session <cr>     " And load session with F3

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
