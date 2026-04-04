" Leader key
let mapleader = ","

" ========== Basic Settings ==========
set nocompatible
set encoding=utf-8
set number relativenumber
set mouse=a
set clipboard+=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
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
syntax on
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
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ========== Appearance ==========
colorscheme gruvbox
let g:gruvbox_background = 'dark'
set termguicolors

" ========== Mappings ==========
" Change without yanking
nnoremap c "_c
" NERDTree toggle
nnoremap <leader>n :NERDTreeToggle<CR>
" FZF file search
nnoremap <leader>f :Files<CR>
nnoremap <C-p> :Files<CR>
" Goyo toggle (normal + distraction-free writing mode)
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>gy :Goyo<CR>:set bg=light<CR>:set linebreak<CR>
" Spell toggle
nnoremap <leader>o :setlocal spell! spelllang=en_us<CR>
" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Replace ex mode with gq
nnoremap Q gq
" Shellcheck
nnoremap <leader>s :!clear && shellcheck %<CR>
" Open bibliography/refs
nnoremap <leader>b :vsp $BIB<CR>
nnoremap <leader>r :vsp $REFER<CR>
" Replace all (positions cursor between the slashes)
nnoremap S :%s//g<Left><Left>
" Open output/preview — guard against unsaved/unnamed buffer
nnoremap <leader>p :call OpenOutput()<CR>
" Vimling toggles
nnoremap <leader>d :call ToggleDeadKeys()<CR>
inoremap <leader>d <esc>:call ToggleDeadKeys()<CR>a
nnoremap <leader>i :call ToggleIPA()<CR>
inoremap <leader>i <esc>:call ToggleIPA()<CR>a
nnoremap <leader>q :call ToggleProse()<CR>
" Vimwiki index
nnoremap <leader>v :VimwikiIndex<CR>

" ========== Helper Functions ==========
function! OpenOutput()
    let l:fname = expand('%')
    if l:fname == ''
        echo "No file name — save the buffer first."
    else
        write
        execute '!opout ' . shellescape(l:fname)
    endif
endfunction

" ========== Plugin Configs ==========
" FZF
let g:fzf_preview_window = ['right:60%']

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {
    \ '.Rmd': 'markdown', '.rmd': 'markdown',
    \ '.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'
    \ }

" ========== Coc.nvim Config ==========
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-angular',
    \ 'coc-explorer',
    \ 'coc-vimtex',
    \ ]

" Tab completion
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Diagnostics navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Format
xmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Code actions
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

" Function text objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Commands
command! -nargs=0 Format   :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=? Fold     :call CocAction('fold', <f-args>)
command! -nargs=0 OR       :call CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ========== Autocommands ==========
augroup aditya_autocmds
    autocmd!
    " Disable auto-comment continuation on new lines
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    " Clean tex build files on exit
    autocmd VimLeave *.tex !texclear %
    " Filetype detection
    autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
    " DWM blocks recompile on config save
    autocmd BufWritePost ~/.local/src/dwmblocks/config.h
        \ !cd ~/.local/src/dwmblocks/ && sudo make install && { killall -q dwmblocks; setsid dwmblocks & }
    " Shortcuts and Xresources reload
    autocmd BufWritePost files,directories !shortcuts
    autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
    " sxhkd reload
    autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
    " Neomutt: open in Goyo automatically
    autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
    autocmd BufRead,BufNewFile /tmp/neomutt* Goyo | set bg=light
    autocmd BufRead,BufNewFile /tmp/neomutt* nnoremap ZZ :Goyo\|x!<CR>
    autocmd BufRead,BufNewFile /tmp/neomutt* nnoremap ZQ :Goyo\|q!<CR>
    " Strip trailing whitespace and trailing blank lines on save
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e
augroup end

" Save as sudo (command-line alias)
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Diff highlight tweak
if &diff
    highlight! link DiffText MatchParen
endif

" End of unified config