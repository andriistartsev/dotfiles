" Disalbe bell
set noerrorbells visualbell t_vb=

" Set language
set langmenu=en_US.UTF-8
let $LANG = 'en_US.UTF-8'

" Backup
set backupdir=~/vimfiles/tmp,. " Backup files folder.
set directory=~/vimfiles/tmp,. " Swap files folder.

" Store session
map <F2> :mksession! ~/vimfiles/tmp/vim_session <CR> " Quick write session with F2
map <F3> :source ~/vimfiles/tmp/vim_session <CR>     " Load session with F3

" Editor
set shiftwidth=4	" Shift width.
set tabstop=4		" Set tabsize.
set autoindent		" Copy indent from current line when starting a new line.
set smartindent		" Automatically inserts one extra level of indentation in some cases, and works for C-like files.
set number			" Set line numbers.
set laststatus=2	" Always display the status line.
set ruler			" Show the cursor position all the time.
set laststatus=2	" Always display the status line

" Search
set incsearch
set ignorecase smartcase " make searches case-sensitive only if they contain upper-case characters

set history=1000
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

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" If a file is changed outside of vim, automatically reload it without asking
set autoread

" Prettify xml
nmap ,f :%s/>\s*</>\r</g<CR>gg=G

" ------------------------------------------------------------------------------
" Plug-in section
" ------------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Set colorscheme for GUI
if has("gui_running")
	set background=dark
	colorscheme solarized
endif

" Toggle nerdtree with F10
map <F10> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F9> :NERDTreeFind<CR>
