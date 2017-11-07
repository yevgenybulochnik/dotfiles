set nocompatible

let mapleader=',' "remapped <leader> from \ line must be above plugins

"Setup vundle
"For vundle to work, you must first use  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
filetype off "filetypes turned off initially for vundle setup

set rtp+=~/.vim/bundle/Vundle.vim "set vim runtime path to inclue vundle
call vundle#begin() "initialize vundle

    Plugin 'VundleVim/Vundle.vim' "have vundle manage vundle
    Plugin 'https://github.com/scrooloose/nerdtree.git' "nerdtree plugin
    Plugin 'https://github.com/airblade/vim-gitgutter.git' "git diff support
    Plugin 'tpope/vim-fugitive' "add git control to vim
    Plugin 'https://github.com/jiangmiao/auto-pairs' "auto complete [{()}]
    Plugin 'https://github.com/leafgarland/typescript-vim' "added typescript support
    Plugin 'vim-airline/vim-airline'
    Plugin 'https://github.com/altercation/vim-colors-solarized'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'quramy/vim-js-pretty-template' "adds support of in-string html syntax highlighting
    Plugin 'w0rp/ale' "adds async linting support depending on linter installed, !!!!Requires Vim 8.0
    Plugin 'mattn/emmet-vim' "adds html support
    Plugin 'ervandew/supertab' "adds omni completion to tabs
    Plugin 'tpope/vim-surround' "adds support for putting ({' ext around word objects
    Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()

filetype plugin indent on "turn filetype autodetection back on
syntax on "turn syntax highlighting on

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

"Airline Settings
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=":t"
let g:airline#extensions#tabline#tab_nr_type = 1 "shows tab number in tab
let g:airline_powerline_fonts = 1
nmap <leader>1 <plug>AirlineSelectTab1
nmap <leader>2 <plug>AirlineSelectTab2
nmap <leader>3 <plug>AirlineSelectTab3
nmap <leader>4 <plug>AirlineSelectTab4
nmap <leader>5 <plug>AirlineSelectTab5
nmap <leader>6 <plug>AirlineSelectTab6
nmap <leader>7 <plug>AirlineSelectTab7
nmap <leader>8 <plug>AirlineSelectTab8
nmap <leader>9 <plug>AirlineSelectTab9

"AlE Settings

"Solarized colorscheme settings
set t_Co=256 "force terminal colors to 256
let g:solarized_termcolors=256
set background=dark
silent! colorscheme solarized

"Vim-Js-Pretty-Template Settings
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces "Necessary for leafgarland/typescript-vim

"Vim-Indent-guides settings
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['nerdtree']
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"TAB settings
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 "number of spaces in tab when editing
set expandtab "tabs are spaces
set shiftwidth=4
autocmd FileType typescript setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType sass setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

"Misc settings
set number
set updatetime=250 "update time to 250ms so git gutter auto updates faster
set incsearch
set wildmenu "visual autocomplete for command menu
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>es :source $MYVIMRC<CR>
silent! highlight EndOfBuffer ctermfg=bg
set breakindent
inoremap <leader>, <C-x><C-o>
