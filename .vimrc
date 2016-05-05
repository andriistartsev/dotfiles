" Disalbe bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Update dir to current file
autocmd BufEnter * silent! cd %:p:h

" Set language and encoding
set langmenu=en_US.UTF-8
let $LANG = 'en_US.UTF-8'
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" Backup
set backupdir=~/vimfiles/tmp,. " Backup files folder.
set directory=~/vimfiles/tmp,. " Swap files folder.

" Editor
set shiftwidth=4    " Shift width.
set tabstop=4       " Set tabsize.
set expandtab       " Replace tabs with spaces
set autoindent      " Copy indent from current line when starting a new line.
set smartindent     " Automatically inserts one extra level of indentation.
set ruler           " Show the cursor position all the time.
set laststatus=2    " Always display the status line

" Indicate max text width
set textwidth=80
set colorcolumn=+1

"" Configure linenumbers
set number
set relativenumber

" System clipboard copy & paste support
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"" Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>

" Search
set incsearch
"" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

set history=100
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

" File associations
autocmd BufEnter *.*proj :setfiletype xml

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" If a file is changed outside of vim, automatically reload it without asking
set autoread

" -----------------------------------------------------------------------------
"  Mappings
" -----------------------------------------------------------------------------

" Prettify files
augroup prettify
    autocmd!
    autocmd FileType xml noremap <Leader>f :%s/>\s*</>\r</g<CR>gg=G
    autocmd FileType json noremap <Leader>f :%!python -m json.tool<CR>
augroup END

" Insert new line before(Shift-Enter) or after(Enter) cursor
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" -----------------------------------------------------------------------------
" Plug-ins
" -----------------------------------------------------------------------------
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

" -----------------------------------------------------------------------------
" Local config
" -----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
