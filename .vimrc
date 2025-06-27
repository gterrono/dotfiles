set relativenumber
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
let mapleader=";"
noremap ;; ;
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
set cursorline
set ls=2

syntax on
filetype on
filetype indent on
filetype plugin on

" nmap <silent> <up> :wincmd k<CR>
" nmap <silent> <down> :wincmd j<CR>
" nmap <silent> <left> :wincmd h<CR>
" nmap <silent> <right> :wincmd l<CR>

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" nmap <up> <nop>
" nmap <down> <nop>
" nmap <left> <nop>
" nmap <right> <nop>

map mks :mksession! sess<CR>
autocmd FileType ruby map z :w<CR> :!ruby -c %<CR>
au FileType python setl sw=4 sts=4 et
au FileType python map <leader>tf :s/True/False/g<CR>:noh<CR>
au FileType python map <leader>ft :s/False/True/g<CR>:noh<CR>
au FileType javascript setl sw=2 sts=2 et

" When writing a file, if there are errors, have Syntastic plugin mark them
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

map! jk <Esc>
map! kj <Esc>
" map! <up> <nop>
" map! <down> <nop>
" map! <left> <nop>
" map! <right> <nop>

" Removing this shortcut to enable tabout
"map <tab> gt
"map <S-tab> gT

map :W :w
map :Q :q

function! TrimWhiteSpace()
  " %s/\s*$//
:endfunction
map <silent> <leader>q :q<CR>
map <leader>wq :call TrimWhiteSpace()<CR>:wq<CR>
map <leader><CR> mv:call TrimWhiteSpace()<CR>`v:w<CR>
map <silent> <leader><Space> mv:call TrimWhiteSpace()`v<CR>
map <leader>p :set paste!<CR>
map <S-Left> gT
map <S-Right> gt

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

map :p<CR> :set paste!<CR>

:nnoremap <silent> <Space> :exec "normal i".nr2char(getchar())."\e"<CR>

" indicate klines over 80
match ErrorMsg /\%>80v.\+/
match ErrorMsg /\s\+$/

let g:CommandTCancelMap=['<ESC>','<C-c>']
map <silent> <C-t> :tabe<CR>

map <Leader>f _f

map <Up> <C-y>
map <Down> <C-e>

map <leader>'a 'A
map <leader>'s 'S
map <leader>'d 'D
map <leader>'f 'F
map <leader>'g 'G
map <leader>'q 'Q
map <leader>'e 'E
map <leader>'r 'R
map <leader>'t 'T
map <leader>'v 'V
map <leader>'c 'C
map <leader>'z 'Z
map <leader>'x 'X

noremap <silent> <leader>v :vs<CR>
noremap <silent> <leader>h :sp<CR>
map <silent> <leader>s :sp<CR>
map <silent> <leader>r :set relativenumber<CR>
map <silent> <leader>n :noh<CR>
map <silent> <leader>bn :bn<CR>
map <silent> <leader>bp :bp<CR>

au VimEnter * syntax keyword Statement lambda conceal cchar=λ
au VimEnter * hi! link Conceal Statement
au VimEnter * set conceallevel=2

command Vim tabe ~/.vimrc
command Reload so ~/.vimrc
map :v :V
map :r :R

noremap <up> <up>
noremap <down> <down>
runtime macros/matchit.vim

set runtimepath^=~/.vim/bundle/ctrlp.vim
