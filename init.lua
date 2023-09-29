vim.cmd([[
set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set incsearch
set nohlsearch
]])

vim.cmd([[
" Plug – Vim plugin manager
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" fzf – fuzzy finder plugin (https://github.com/junegunn/fzf.vim)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',

" https://github.com/Mofiqul/dracula.nvim
Plug 'Mofiqul/dracula.nvim'

" https://github.com/echasnovski/mini.animate
Plug 'echasnovski/mini.animate', { 'branch': 'stable' }

call plug#end()
]])

vim.cmd([[
" dracula.nvim config
"colorscheme dracula
colorscheme dracula-soft
]])

vim.cmd([[
let mapleader=" "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
]])

vim.cmd([[
" navigate over results of a quicklist, e.g. `:grep <term> **/*.ts`
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>
]])

vim.cmd([[
" https://github.com/echasnovski/mini.animate
lua require('mini.animate').setup()
]])

vim.cmd([[
" copy to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
]])

vim.cmd([[
" move selected lines up/down
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv
]])

