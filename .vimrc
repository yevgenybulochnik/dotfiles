if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'morhetz/gruvbox'
call plug#end()

"General settings
let mapleader=','
set number
set updatetime=250 "update time to 250ms so git gutter auto updates faster
set incsearch
set wildmenu "visual autocomplete for command menu
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>es :source $MYVIMRC<CR>

"Tab setting
set tabstop=2 "number of visual spaces per TAB
set softtabstop=2 "number of spaces in tab when editing
set expandtab "tabs are spaces
set shiftwidth=2

"Colorscheme Settings
silent! colorscheme gruvbox
set background=dark

"NerdTree Settings
let NERDTreeShowHidden=1 "force nerdtree to show hidden files
let NERDTreeIgnore = ['\.swp$'] "hide .swp files
let NERDTreeMinimalUI=1 "hide Press ? for help
autocmd bufenter * if (winnr("$")==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "auto close NERDTree if only one tab open
autocmd StdinReadPre * let s:std_in=1 "Open NERDtree if no file specified
autocmd VimEnter * if argc()==0 && !exists("s:std_in") | NERDTree | endif " ^
map <F2> :NERDTreeToggle<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"NERDCommenter Settings
nnoremap <leader>c :call NERDComment(0,"toggle")<CR>
vnoremap <leader>c :call NERDComment(0,"toggle")<CR>
