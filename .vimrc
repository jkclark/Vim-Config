set nocompatible
syntax on
filetype off							" required for Vundle

""" The comments may not look like they line up. They are lined up on column
""" 41 in my terminal when I load this file up in Vim. Not sure why this happens.
" ### Settings ###
set noshowmode							" never show mode
set nowrap								" don't wrap lines
set tabstop=4							" a tab is four spaces
set softtabstop=4						" when hitting <BS>, pretend like removing a tab, even if spaces
set noexpandtab							" use tabs not spaces
set shiftwidth=4						" number of spaces to use for autoindenting
set shiftround							" use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start			" allow backspacing over everything in insert mode
set autoindent							" always set autoindenting on
set copyindent							" copy the previous indentation on autoindenting
set number								" always show line numbers
set showmatch							" set show matching parenthesis
set ignorecase							" ignore case when searching
set smartcase							" ignore case if search pattern is all lowercase,
										"	 case-sensitive otherwise
set smarttab							" insert tabs on the start of a line according to
										"	 shiftwidth, not tabstop
set scrolloff=4							" keep 4 lines off the edges of the screen when scrolling
set hlsearch							" highlight search terms
set incsearch							" show search matches as you type
set gdefault							" search/replace "globally" (on a line) by default
set listchars=tab:»\ ,trail:·,extends:→,nbsp:· ",eol:↲	also this option for tab:▸
set list								" show invisible characters by default,
										" but it is enabled for some file types (see later)
set pastetoggle=<F2>					" when in insert mode, press <F2> to go to
										"	 paste mode, where you can paste mass data
										"	 that won't be autoindented
set mouse=a								" enable using the mouse if terminal emulator
										"	 supports it (xterm does)
set fileformats="unix,dos,mac"
set formatoptions+=1					" When wrapping paragraphs, don't end lines
										"	 with 1-letter words (looks stupid)

set shortmess+=I						" hide the launch screen
set clipboard=unnamed					" normal OS clipboard interaction
set autoread							" automatically reload files changed outside of Vim

"set updatetime=1000					" Speed up the updatetime so gitgutter and friends are quicker

" Make the keyboard faaaaaaast
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50

" Toggle show/hide invisible chars
nnoremap <leader>I :set list!<cr>

" Toggle line numbers
nnoremap <leader>N :setlocal number!<cr>

" Thanks to Steve Losh for this liberating tip
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v

set foldenable							" enable folding
set foldmethod=indent
set foldlevelstart=99					" start out with everything unfolded

set laststatus=2						" always show a status line
set cmdheight=2							" use a status bar that is 2 rows high

set history=1000						" remember more history
set undolevels=1000						" more undo levels
if v:version >= 730
	set undofile						" keep a persistent backup file
	set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup							" do not keep backup files
set noswapfile							" do not write annoying intermediate swap files
set directory=~/.vim/.tmp,~/tmp,/tmp	" store swap files in one of these places
										"	 (in case they are ever turned on)
set viminfo='20,\"80					" read/write a .viminfo file
										" don't store more than 80 lines of
										"	 registers
set wildmenu							" make tab completion for files act like bash
set wildmode=list:full					" show a list when pressing tab and complete first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title								" change the terminal's title
set visualbell							" don't beep
set noerrorbells						" don't beep
set showcmd								" show (partial) command in the last line of the screen
										"	 this also shows visual selection
										"	 info
set updatetime=1000
set encoding=utf-8
set nomodeline							" disable mode lines (security measure)
set ruler								" show line and column in status bar
set colorcolumn=110						" ruler at column 80
set nocursorline						" don't highlight current line
" toggle highlighting the cursor line
nnoremap <leader>, :set cursorline!<cr>

" wrap lines for txt and md files specifically
autocmd BufRead,BufNewFile *.txt setlocal wrap linebreak
autocmd BufRead,BufNewFile *.md setlocal wrap linebreak
" ### End Settings ###

" ### Mappings ###
" jj exits insert mode
inoremap jj <Esc>

" enter inserts lines without leaving insert mode
nnoremap <S-CR> O<Esc>
nnoremap <CR> o<Esc>

" quick yank to EOL
nnoremap Y y$

" clear the search register
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Pull word under cusor into LHS of a substitute (for quick search and
"	 replace)
nnoremap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Keep search matches in the middle of the window and pulse the line when
"	 moving to them
" nnoremap n n:call PulseCursorLine()<cr>
" nnoremap N N:call PulseCursorLine()<cr>

" Sudo to write
cnoremap w!! w !sudo tee % > /dev/null

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" ### End Mappings ###

" ### Plugins ###
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
colorscheme brogrammer

Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims=1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs=1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace=1

Plugin 'jiangmiao/auto-pairs'
" disable fast wrap
let g:AutoPairsShortcutFastWrap=""

Plugin 'tpope/vim-surround'

Plugin 'ervandew/supertab'

Plugin 'scrooloose/nerdtree'
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open a NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Open a NERDTree with Ctrl-n
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plugin 'airblade/vim-gitgutter'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='light'

let g:airline_powerline_fonts=1
let g:airline#extensions#syntastic#enabled=1	" allow airline to work with syntastic
let airline#extensions#syntastic#error_symbol='E:'
let airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#syntastic#warning_symbol = 'W:'
let airline#extensions#syntastic#stl_format_warn = '%W{[%w(#%fw)]}'

Plugin 'tpope/vim-fugitive'				" git wrapper

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" autocmd BufWritePre *.go call go#lint#Run() " run :GoLint on save

" Plugin 'Shougo/echodoc' " I wish I could but I can't figure out how to make this work
" let g:echodoc_enable_at_startup=1

Plugin 'davidhalter/jedi-vim'			" Enable for Python

Plugin 'pangloss/vim-javascript'

Plugin 'alvan/vim-closetag'

" # Syntastic #
Plugin 'vim-syntastic/syntastic'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

let g:syntastic_go_checkers=["gofmt", "go", "golint", "govet"]
let g:syntastic_python_checkers=['flake8']
let g:syntastic_c_checkers=["gcc"]
let g:syntastic_html_tidy_ignore_errors = [
  \   'letter not allowed here' ] 
let g:syntastic_python_flake8_post_args='--ignore=E116,'
" # End Syntastic #

Plugin 'ctrlpvim/ctrlp.vim'

" All plugins must be added before the following line
call vundle#end()						" required for Vundle
filetype plugin indent on				" required for Vundle
" ### End Plugins ###
