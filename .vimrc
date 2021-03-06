set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
"bundles here:
Plugin 'mileszs/ack.vim'
Plugin 'dense-analysis/ale'
Plugin 'metakirby5/codi.vim'
Plugin 'gberenfield/cljfold.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'venantius/vim-cljfmt'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'evansalter/vim-checklist'
"Requires a nerd-font to be installed on machine...
"See: https://github.com/ryanoasis/nerd-fonts
"Install then set as terminal font
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'junegunn/goyo.vim'

call vundle#end()

let g:ale_linters = {'clojure': ['clj-kondo']}

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:airline_theme='base16_pop'
set encoding=UTF-8
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

let g:syntastic_javascript_jshint_conf="~/.jshintrc"
let g:syntastic_javascript_jscs_args = "-c ~/.jscsrc"
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:clojure_foldwords = "def,defn,ns"

"window keybindings
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"handle wrapped lines more comfortably
nnoremap j gj
nnoremap k gk

"checklist plugin bindings
nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
nnoremap <leader>ce :ChecklistEnableCheckbox<cr>
nnoremap <leader>cd :ChecklistDisableCheckbox<cr>
vnoremap <leader>ct :ChecklistToggleCheckbox<cr>
vnoremap <leader>ce :ChecklistEnableCheckbox<cr>
vnoremap <leader>cd :ChecklistDisableCheckbox<cr>

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

"keybindings for ctrlP
let g:ctrlp_map = '<c-p>'

" reindent file mapping
map <F7> mzgg=G`z<CR>

" strip trailing whitepsace on save. The * is file match pattern.
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufEnter * :syntax sync fromstart
" cljfmt settings
let g:clj_fmt_autosave = 0

colorscheme desert
highlight Directory ctermfg=cyan
hi Comment ctermfg=LightBlue

"Turn on rainbow everything
"au VimEnter * RainbowParenthesesActivate
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
