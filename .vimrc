set nocompatible

let mapleader = " "

call plug#begin('~/.vim/plugged')

Plug 'gmarik/vundle'
Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
Plug 'metakirby5/codi.vim'
Plug 'gberenfield/cljfold.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'kien/rainbow_parentheses.vim'
Plug 'venantius/vim-cljfmt'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'evansalter/vim-checklist'
"Requires a nerd-font to be installed on machine...
"See: https://github.com/ryanoasis/nerd-fonts
"Install then set as terminal font
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/goyo.vim'
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'TovarishFin/vim-solidity'
Plug 'pangloss/vim-javascript'
Plug 'jpalardy/vim-slime'
call plug#end()

let g:iced_enable_default_key_mappings = v:true
let g:ale_linters = {'clojure': ['clj-kondo']}
let g:slime_target = "tmux"
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:airline_theme='base16_pop'
set guifont=Hasklung\ Nerd\ Font\ 11
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

hi Pmenu ctermfg=grey ctermbg=black
