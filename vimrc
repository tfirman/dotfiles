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

nnoremap <C-f> :Unite grep:.<cr>
nnoremap <C-k> :Unite -quick-match buffer<cr>
nnoremap <C-p> :Unite file_rec/async<cr>

" Start insert.
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1

" To track long mru history.
let g:unite_source_file_mru_long_limit = 3000
let g:unite_source_directory_mru_long_limit = 3000

" Like ctrlp.vim settings.
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Prompt choices.
let g:unite_prompt = '❫ '
let g:unite_prompt = '» '

" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
