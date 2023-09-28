set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Plug – Vim plugin manager
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" fzf – fuzzy finder plugin (https://github.com/junegunn/fzf.vim)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',

" https://github.com/Mofiqul/dracula.nvim
Plug 'Mofiqul/dracula.nvim'

call plug#end()

"colorscheme desert 
"colorscheme slate 

" dracula.nvim config
"colorscheme dracula
colorscheme dracula-soft

let mapleader=" "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>

