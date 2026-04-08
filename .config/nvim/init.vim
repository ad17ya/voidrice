" Aditya's Super Config

" Leader key
let mapleader = ","

" Basic settings
set nocompatible
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set mouse=a
set clipboard+=unnamedplus
set encoding=utf-8
set ignorecase
set smartcase
set incsearch
set splitbelow
set splitright
set nowrap
set signcolumn=yes
set noerrorbells
set colorcolumn=120
set wildmode=longest,list,full
set background=dark
set updatetime=300
set nobackup
set nowritebackup
set shortmess+=c
filetype plugin indent on
highlight ColorColumn ctermbg=0 guibg=lightgrey

" ========== Plugin Management (vim-plug) ==========
if has('nvim')
    let s:plug_path = stdpath('data') . '/site/autoload/plug.vim'
else
    let s:plug_path = expand('~/.vim/autoload/plug.vim')
endif
if empty(glob(s:plug_path))
    silent execute '!mkdir -p ' . fnamemodify(s:plug_path, ':h')
    silent execute '!curl -fLo ' . s:plug_path . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
if has('nvim')
    call plug#begin(stdpath('data') . '/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
call plug#end()

" ===== coc.nvim TAB completion fix =====

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Enter to confirm suggestion
inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
