" Invoke pathogen
execute pathogen#infect()

" no need to be compatible
set nocompatible

" Toggling copen cclose
nnoremap <F8> :cclose<cr>
"
" Toggling spell check
nnoremap \sp :call SpellCheckToggle()<cr>
let g:spellcheck_is_open = 1
function! SpellCheckToggle()
    if g:spellcheck_is_open
        set spell spelllang=en_us
        let g:spellcheck_is_open = 0
    else
        set nospell
        let g:spellcheck_is_open = 1
    endif
endfunction

" Set encoding
scriptencoding utf-8
set encoding=utf-8

" Allow backspace in terminal vim
set backspace=indent,eol,start

" Change directory automatically
"set autochdir


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" Stop the stupid window from popping up:
"map q: :q
" Quickly select text you just pasted: `[ goes to beginning of last visual
" select v starts vis-select and `] goes to end
noremap gV `[v`]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colorscheme settings
"let base16colorspace=256 " Access colors present in 256 colorspace
set t_Co=256 " 256 color mode
"set background=dark
if has('gui_running')
    colorscheme monokai
endif
colorscheme molokai

" Case insensitivy
set ignorecase

" Add jj as an Esc options
inoremap jj <Esc>

" set syntax and filetype helpers on
syntax on
filetype plugin on
filetype indent on
set fileformats=unix,dos,mac
set nu

" self explained paste toggle
set pastetoggle=<F7>

" Fix tabs to spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Auto Commands:
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Incremental searching with smartcase
set incsearch
set ignorecase smartcase

" Make airline work without needing NERDTree active
set laststatus=2

" Show spaces and tabs
set listchars=tab:»·,trail:·,space:·
" Toggle chars on and off
nnoremap <F6> :set list!<CR>

" Uncomment this to have \ be the paredit leader, at the moment it is ,
" let g:paredit_leader = '\'

" Enable mouse use in all modes
set mouse+=a
" Allows mouse dragging with tmux (for vim splits)
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
" This is the setting that allows me to select past column 222
set ttymouse=sgr

" Set leader
let mapleader="\<Space>"

" Display all matching files when we tab complete, I like this
set wildmenu

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" System clipboard copy / cut / paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Type <Leader>w to save, neat! OR <Leader>q to close
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wa<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa!<CR>
nnoremap <Leader>r :source ~/.vimrc<CR>

" Neither of these get used much
" Trying to map <Space><Space> in normal mode to alternate buffer
nnoremap <Space><Space> :b#<CR>
" Next buffer
nnoremap <Space><Tab> :bp<CR>
" Previous buffer
nnoremap <Space><S-Tab> :bn<CR>

map Q gq

set nowrap

set completeopt-=preview

" Neat searching trick
set path+=**

" Display all matching files when we tab complete, I like this
set wildmenu

" These are modifications to make netrc nicer to use
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" How cool is gn, it will set the selected directory to the root
" Also s will sort-by different things (like showing dot files)

set wildignore+=vendor,pkg,bin,Applications,Library,Music,Pictures,Public,node_modules,build,logs,target,out,tmp

"unmap <C-t>
map <C-t> <Nop>
map <C-t> :CommandT<CR>

" Indent - ing
set smartindent
set autoindent

" Adding an emacs command to vim
imap <C-b> <esc>ha
imap <C-f> <esc>la
imap <C-e> <esc>$a
imap <C-a> <esc>^i

autocmd FileType clojure setlocal shiftwidth=2 tabstop=2

" Matches HTML tags! cool!
packadd! matchit

nnoremap <C-w><C-t> :tabe<CR>

" Neat hacky technique I basically made up to shrink and expand my vim splits
" by storing ctrl-w + and ctrl-w - in the p and o register respectively
let @p = "+"
let @o = "-"

highlight link xmlEndTag xmlTag

" Change tabs quickly
nnoremap <leader>l gt
nnoremap <leader>h gT

"set isfname+=-
" adds - to the keyword list so order-search will count as one word
set iskeyword+=-

" Put all the backups & swap in one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Kevin suggested this
set sessionoptions-=options

" Search for a chunk visually and use //<CR> to find more of it
vnoremap // y/\V<C-R>=substitute( @", "\\v([/\\\\])", "\\\\\\1", "g" )<CR><CR>
vnoremap ?? y?\V<C-R>=substitute( @", "\\v([?\\\\])", "\\\\\\1", "g" )<CR><CR>

map <C-c> <Esc>

" At 3 lines away the screen will start scrolling
set scrolloff=3

imap <C-j> <C-o>i<CR><CR><C-o>k<Tab>

nnoremap ]c :cn<CR>
nnoremap [c :cp<CR>

set hlsearch
nnoremap <CR> :nohlsearch<CR>
" for the Noral background
"highlight Normal ctermbg=234
hi Normal ctermbg=234
hi Search ctermbg=555
" reference here for awesome colors
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
hi IncSearch ctermbg=72 ctermfg=46
" hi Search ctermbg=222

nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt

set shortmess+=c

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
