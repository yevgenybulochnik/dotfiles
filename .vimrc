set nocompatible 

"Setup vundle 
"For vundle to work, you must first use  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
filetype off "filetypes turned off initally for vundle setup

set rtp+=~/.vim/bundle/Vundle.vim "set vim runtime path to inclue vundle
call vundle#begin() "initialize vundle

	Plugin 'VundleVim/Vundle.vim' "have vundle manage vundle

	Plugin 'https://github.com/scrooloose/nerdtree.git' "nerdtree plugin

	Plugin 'https://github.com/airblade/vim-gitgutter.git' "git diff support 

	Plugin 'tpope/vim-fugitive' "add git control to vim

    Plugin 'http://github.com/jiangmiao/auto-pairs' "auto complete [{()}]

    Plugin 'https://github.com/leafgarland/typescript-vim' "added typescript support

call vundle#end()

filetype plugin indent on "turn filetype autodetection back on 
syntax on "turn syntax highlighting on

"NerdTree settings
let NERDTreeShowHidden=1 "force nerdtree to show hidden files
let NERDTreeIgnore = ['\.swp$'] "hide .swp files
autocmd bufenter * if (winnr("$")==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "auto close NERDTree if only one tab open
autocmd StdinReadPre * let s:std_in=1 "Open NERDtree if no file specified
autocmd VimEnter * if argc()==0 && !exists("s:std_in") | NERDTree | endif " ^
map <F2> :NERDTreeToggle<CR>

"TAB settings 
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 "number of spaces in tab when editing
set expandtab "tabs are spaces 
set shiftwidth=4 

"Misc settings
set number
set updatetime=250 "update time to 250ms so git gutter auto updates faster
set incsearch
