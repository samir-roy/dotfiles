colorscheme nord

" configure ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" turn on syntax highlighting
syntax on

" remap keys
inoremap jj <Esc>
nnoremap J 20jzz
nnoremap K 20kzz
vnoremap J 20jzz
vnoremap K 20kzz

let mapleader="\\"

nmap <leader>b ^
nmap <leader>e $
vmap <leader>b ^
vmap <leader>e $

