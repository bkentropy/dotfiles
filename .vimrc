" Invoke pathogen
execute pathogen#infect()

let g:jsx_ext_required = 0

" no need to be compatible
set nocompatible

" Toggling copen cclose
"nnoremap <F8> :call QuickfixToggle()<cr>
nnoremap <F8> :cclose<cr>
let g:quickfix_is_open = 1
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

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

" should these be syntax enable?
syntax on
filetype plugin on
filetype indent on
set fileformats=unix,dos,mac
set nu

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>
" Open NERDTree by default
" autocmd VimEnter * NERDTree
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

" Maps [,ag] to run Ack with ag
nnoremap <Leader>ag :Ack!<space>
" Map [,K] to YcmCompleter GoTo
nnoremap <Leader>K :YcmCompleter GoTo<CR>

" This should enable ag from the vim :command line
let g:ackprg = 'ag --vimgrep'
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif
" Search for word under cursor -- Tight! the Ack plugin is way cool, and lets
" me use O to close the quick search window
nnoremap <Leader>s :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Toggle Rainbow Parens
let g:rainbow_active = 0 "0 if you want to enable it later via :RainbowToggle
map <F5> :RainbowToggle<CR>

map <F9> :SignatureToggle<CR>

" If you want rust's to autoformat at save uncomment this
"let g:rustfmt_autosave = 1
let g:ycm_rust_src_path="/Users/briankustra/Rust/rust-master/src/"
let g:ycm_python_binary_path = 'python'

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

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
" Trying to map <Space><Space> in normal mode to $
nnoremap <Space><Space> $
" Trying to map 66 in normal mode to ^
nnoremap <BS><BS> ^

" Start NERDTree automatically, not quite what I want. But this will open
" NERDTree auto matically
" autocmd vimenter * NERDTree

map Q gq

set nowrap

set completeopt-=preview

"au FileType go nmap <Leader>fd <Plug>(go-doc)
au FileType go nmap <Leader>gd <Plug>(go-def)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gg <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

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

" Upgraded GO highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_def_mapping_enabled = 0

set wildignore+=vendor,pkg,bin,Applications,Library,Music,Pictures,Public,node_modules,build,logs,target,out,tmp

"unmap <C-t>
map <C-t> <Nop>
map <C-t> :CommandT<CR>

" I want <Leader>> to slurp not just >
" let g:paredit_shortmaps = 1

" Indent - ing
set smartindent
set autoindent

" Adding an emacs command to vim XD
imap <C-b> <esc>ha
imap <C-f> <esc>la
imap <C-e> <esc>$a
imap <C-a> <esc>^i

autocmd FileType clojure setlocal shiftwidth=2 tabstop=2

" Matches HTML tags! cool!
packadd! matchit

"""""""""""""""""
" Tern settings
"""""""""""""""""
let g:tern_show_argument_hints='on_hold'
" and
let g:tern_map_keys=1

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

" Map my F18 and F19 keys to goto next item in quickfix list
" very little use, none I think
set <F18>=[32~
set <F19>=[33~
map <F18> :cp<CR>
map <F19> :cn<CR>

" Search for a chunk visually and use //<CR> to find more of it
vnoremap // y/\V<C-R>=substitute( @", "\\v([/\\\\])", "\\\\\\1", "g" )<CR><CR>
vnoremap ?? y?\V<C-R>=substitute( @", "\\v([?\\\\])", "\\\\\\1", "g" )<CR><CR>

" Minimal easymotion stuff
let g:EasyMotion_do_mapping = 0
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" I don't think I really like this one. Its like / search but it does go up
" too, but it doesn't search beyond screen!
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>f <Plug>(easymotion-w)

" Default mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-c>'
map <C-c> <Esc>

" At 3 lines away the screen will start scrolling
set scrolloff=3

"command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
"function! QuickfixFilenames()
"  " Building a hash ensures we get each buffer only once
"  let buffer_numbers = {}
"  for quickfix_item in getqflist()
"    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
"  endfor
"  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
"endfunction

nnoremap ,html :-1read $HOME/data/template.html<CR>/body<CR>o

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
