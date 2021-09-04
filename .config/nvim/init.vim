" Aditya's neovim config


call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim'
Plug 'preservim/nerdtree'
Plug 'lukesmithxyz/vimling'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'

call plug#end()

source ~/.config/nvim/basic-settings.vim
source ~/.config/nvim/plugconfig/standard-map.vim
source ~/.config/nvim/plugconfig/autocmd.vim
source ~/.config/nvim/plugconfig/nerd-tree.vim
source ~/.config/nvim/plugconfig/vimling.vim
source ~/.config/nvim/plugconfig/fzf.vim
source ~/.config/nvim/plugconfig/goyo.vim
source ~/.config/nvim/plugconfig/coc.vim
