set number
set ruler
set autoindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set hlsearch
set incsearch
set hidden
set nocompatible

syntax on
filetype on
filetype indent on
filetype plugin on

nmap <silent> <up> :wincmd k<CR>
nmap <silent> <down> :wincmd j<CR>
nmap <silent> <left> :wincmd h<CR>
nmap <silent> <right> :wincmd l<CR>

map qq :wq<CR>
map Q :q<CR>
map mks :mksession! sess<CR>
autocmd FileType ruby map z :w<CR> :!ruby -c %<CR>
au FileType python setl sw=4 sts=4 et

" When writing a file, if there are errors, have Syntastic plugin mark them
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

map! jk <Esc>
map! kj <Esc>

map <tab> gt

map :W :w
map :Q :q

map :p<CR> :set paste!<CR>

:nnoremap <Space> :exec "normal i".nr2char(getchar())."\e"<CR>
