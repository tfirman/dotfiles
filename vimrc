set shell=sh

execute pathogen#infect()

set backupdir=$HOME/local/tmp

syntax on
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab

vmap <C-x> :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR> 

let g:ackprg = 'ag --nogroup --nocolor --column'
nmap <C-S-F> :Ack<space>

