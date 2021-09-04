let mapleader =","

"autoinstall plugins if config files are copied
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" defaults:

    colorscheme gruvbox
    set bg=dark
    set go=a
    set mouse=a
    set nohlsearch
    set clipboard+=unnamedplus
	set nocompatible
	set smartindent
	set incsearch
	set encoding=utf-8
	set number relativenumber
	set tabstop=4 softtabstop=4
	set shiftwidth=4
	set expandtab
    set signcolumn

	nnoremap c "_c
	syntax on
	filetype plugin on
	highlight ColorColumn ctermbg=0 guibg=lightgrey

" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    source ~/.config/nvim/plugconfig/goyo.vim


" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright
