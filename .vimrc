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
map <silent> <left> :tabp <CR>
map <silent> <right> :tabn <CR>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map qq :wq<CR>
map Q :q<CR>
map mks :mksession! sess<CR>
autocmd FileType ruby map z :w<CR> :!ruby -c %<CR>

map! ii <Esc>

map :W :w
map :Q :q

:nnoremap <Space> :exec "normal i".nr2char(getchar())."\e"<CR>
