set nocompatible              " Don't be compatible with vi
filetype on                   " try to detect filetypes

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github

" Utility
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/Gundo'
Plugin 'phleet/vim-mercenary'
Plugin 'wesQ3/vim-windowswap'
Plugin 'SirVer/ultisnips'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-dispatch'

" Generic Programming Support
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'msanders/snipmate.vim'
Plugin 'gilsondev/searchtasks.vim'
Plugin 'WolfgangMehner/vim-plugins'
Plugin 'honza/vim-snippets'
Plugin 'Townk/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'tobyS/vmustache'

" Markdown/Writting
Plugin 'tpope/vim-surround'
Plugin 'plasticboy/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'

" Git Support
Plugin 'kablamo/vim-git-log'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'

" C/C++ Support

" Python Support
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'

" Web-Dev Support (PHP, JS, HTML, CSS)
Plugin 'wookiehangover/jshint.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'phpvim/phpcd.vim'
Plugin 'tobyS/pdv'

" Theme/Interface
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'ryanoasis/vim-devicons'

let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Makefile fixes
autocmd FileType make setlocal noexpandtab

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype indent plugin on     " enable loading indent file for filetype
set numberwidth=1             " using only 1 column (and 1 space) while possible
set title                     " show title in console title bar

set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

let mapleader = ","
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>h :A<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>/ :nohlsearch<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ag
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>d :Make!
nnoremap <leader>r :TestFile<CR>
nnoremap <leader>g :call RunGoFile()<CR>
" Paste from clipboard
nnoremap <leader>p "+p
" Quit window
nnoremap <leader>q :q<CR>
vnoremap <leader>y "+y

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window

" don't bell or blink
set noerrorbells
set novisualbell
set vb t_vb=

" Set the colorscheme
colorscheme inkpot
set background=dark

""" Moving Around/Editing
set nocursorline	"highlight current line
set ruler
set nowrap
set linebreak
set showmatch		"highlight matching parenthesis
set backspace=indent,eol,start
let g:vimwiki_list=[{'path':'~/.wiki/'}]
set autoindent      " Indent automatically
set tabstop=4		" 4 space tab
set expandtab		" use spaces for tabs
set softtabstop=4	" 4 space tab
set shiftwidth=4
set shiftround
set smarttab
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set matchpairs+=<:>
set nolist
set number		"show line numbers
set relativenumber "show the relative distance
highlight LineNr ctermfg=grey
set showcmd		"show command in bottom bar
set fillchars+=vert:\|

""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set encoding=utf8           " Set utf8 as standard encoding.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
set spell spelllang=en_us   " Spell checking
set pastetoggle=<F1>          " Use <F1> to toggle between 'paste' and 'nopaste'
map <silent> <F2> :NERDTreeToggle<CR>
" toggle line numbers for pasting out of vim.
map <silent> <F3> :set number!<CR>:set relativenumber!<CR>
map <silent> <F4> :setlocal spell! spelllang=en_us<CR>
" Reload Vimrc
map <silent> <F5> :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Searching
set ignorecase		"ignore case when searching
set smartcase
set incsearch		"search as character are entered
set hlsearch		"highlight all matches
set magic

"Folding
set foldmethod=syntax 	"fold based on indent level
set foldnestmax=10	"max 10 depth
set foldenable		"don't fold files by default on open
set foldlevelstart=10	"start with fold level of 1
" Fold on space
nnoremap <space> za

"}}}
"Line Shortcuts{{{
nnoremap j gj
nnoremap k gk
nnoremap gV'[v']
"}}}
"Insert Completion{{{
set completeopt=menuone,longest,preview
set pumheight=6
"}}}
"Coding Style{{{
set colorcolumn=81
highlight ExtraWhiteSpace ctermbg=darkgreen ctermfg=white guibg=darkgreen
call matchadd('ExtraWhiteSpace', '\s\+\%#\@<!$')
highlight OverLength ctermbg=red ctermfg=white guibg=red
match OverLength /\%>80v.\+/
"}}}
"CtrlP{{{
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_switch_buffer=0
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore='\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
"}}}
"Syntastic{{{
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files=['.java$']
let g:syntastic_python_python_exec='python3'
"}}}
"AutoGroups{{{
augroup configgroup
    autocmd!
    autocmd VimEnter *highlight clear SignColumn
    autocmd BufWritePRe *.php, *.py, *.js, *.txt, *.hs, *.java, *.md, *.rd :call<SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal ft=markdown
augroup END
"}}}
"Testing{{{
let test#strategy = 'neovim'
let test#python#runner = 'nose'
"}}}
"Backups{{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"}}}
"airline{{{
set laststatus=2
let g:airline_theme = 'zenburn'
let g:airline_left_sep=''
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_right_sep=''
"}}}
"Custom Functions{{{
function!ToggleNumber()
    if(&relativenumber ==1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

"strips trailing whitespace at the end of files. this
"is called on buffer write in the autogroup above.
function!<SID>StripTrailingWhitespaces()
    "save last search & cursor position
    let _s=@/
    let l=line(".")
    let c=col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l,c)
endfunction

function!<SID>CleanFile()
    "Preparation:save last search and cursor position
    let _s=@/
    let l=line(".")
    let c=col(".")
    %!git stripspace
    let @/=_s
    call cursor(l,c)
endfunction
"}}}
