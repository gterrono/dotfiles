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

syntax on
filetype on
filetype plugin on

nmap <silent> <up> :wincmd k<CR>
nmap <silent> <down> :wincmd j<CR>
nmap <silent> <left> :wincmd h<CR>
nmap <silent> <right> :wincmd l<CR>

map qq :wq<CR>
map Q :q<CR>
map mks :mksession! sess<CR>
autocmd FileType ruby map z :w<CR> :!ruby -c %<CR>

map! jk <Esc>
map! kj <Esc>

map :W :w
map :Q :q

:nnoremap <Space> :exec "normal i".nr2char(getchar())."\e"<CR>
