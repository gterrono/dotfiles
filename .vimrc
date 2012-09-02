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

map <up> <nop>
map <down> <nop>
map <left> :tabp <CR>
map <right> :tabn <CR>
map qq :wq<CR>
map Q :q<CR>
map mks :mksession sess<CR>
autocmd FileType ruby map z :w<CR> :!ruby -c %<CR>

map! ii <Esc>

map :W :w
map :Q :q

:nnoremap <Space> :exec "normal i".nr2char(getchar())."\e"<CR>
