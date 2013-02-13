"nocompatible: enabling features which are not Vi compatible
set nocp

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" settings for colors
set t_Co=256
" let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme asmanian_blood

set nocp         "nocompatible: enabling features which are not Vi compatible
set autoindent
set smartindent
set expandtab
set mouse=a      "Enable mouse support in console
set number       "Line Numbers
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set hlsearch     " Highlight things that we find with the search
set showmatch    " show matching brackets
set showcmd      " This shows what you are typing as a command.
set autochdir    " always switch to the current file directory
set wildmenu     " turn on command line completion wild style
set cursorline   " highlight current line
set autoread     " read when a file is changed from the outside
set noswapfile
set linebreak
set showbreak=   \| 
set statusline=%t

syn on


map <F5> :!clear;make
map <F6> :!clear;./main.out

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map auto complete of (, ", ', [
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {}<Esc>i
" inoremap < <><Esc>i
" " inoremap " ""<Esc>i
" inoremap } {<CR><BS>}<Esc>ko

" type jkl to escape in insertmode
inoremap jkl <Esc>
nnoremap JJJJ <Nop>

" Needed fMaor Syntax Highlighting
filetype on
filetype plugin on
filetype indent on

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Folding settings
highlight Folded ctermfg=white ctermbg=black
set foldmethod=syntax
set foldnestmax=5
set nofoldenable
set foldlevel=1

" Load vim-latex for empty tex files
let g:tex_flavor='latex'



" --- OmniCppComplete ---
" -- required --
set nocp " non vi compatible mode
filetype plugin on " enable plugins
" -- optional --
" auto close options when exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone
" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
" -- ctags --
" map <ctrl>+F12 to generate ctags for current folder:
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" add current directory's generated tags file to available tags
set tags+=~/.myTags/std3.3.tags
set tags+=./tags
