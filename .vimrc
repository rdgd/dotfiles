set nocompatible
filetype off "allow pathogen to detect filetypes

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'gmarik/vundle'
"bundles here:
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'venantius/vim-cljfmt'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:ackprg = '/usr/local/Cellar/ack/2.22/bin/ack'
call vundle#end()
syntax on
filetype on
filetype plugin indent on
set autoindent
set smartindent
set tabstop=2 shiftwidth=2 expandtab
set shiftwidth=2
set showmatch
set guioptions-=T
set vb t_vb=
set ruler
set incsearch
set ignorecase
set smartcase
set gfn=Anonymous\ Pro
set number
set foldmethod=indent
set foldlevel=99
set backspace=indent,eol,start " backspace over everything in insert mode

"specify jshintrc location
let g:syntastic_javascript_jshint_conf="~/.jshintrc"

"specify jscsrc location
let g:syntastic_javascript_jscs_args = "-c ~/.jscsrc"

"enable both JS checkers
let g:syntastic_javascript_checkers = ['jshint', 'jscs']

"window keybindings
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"handle wrapped lines more comfortably
nnoremap j gj
nnoremap k gk

"toggle NERDTree with control-e
nnoremap <C-e> :NERDTreeToggle<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" bind K to grep word under cursor
nnoremap <A-K> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"keybindings for ctrlP
let g:ctrlp_map = '<c-p>'

" reindent file mapping
map <F7> mzgg=G`z<CR>

" strip trailing whitepsace on save. The * is file match pattern.
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufEnter * :syntax sync fromstart
" cljfmt settings
let g:clj_fmt_autosave = 0
"Turn on rainbow everything
au VimEnter * RainbowParenthesesActivate
au VimEnter * RainbowParenthesesLoadRound
au VimEnter * RainbowParenthesesLoadSquare
au VimEnter * RainbowParenthesesLoadBraces
au VimEnter * RainbowParenthesesToggle


