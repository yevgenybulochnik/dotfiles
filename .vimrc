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

call vundle#end()

filetype plugin indent on "turn filetype autodetection back on 
syntax on "turn syntax highlighting on

"TAB settings 
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 "number of spaces in tab when editing
set expandtab " tabs are spaces 

set shiftwidth=4 
set number
set updatetime=250 "update time to 250ms so git gutter auto updates faster

"NerdTree settings
let NERDTreeShowHidden=1 "force nerdtree to show hidden files
let NERDTreeIgnore = ['\.swp$'] "hide .swp files
map <F2> :NERDTreeToggle<CR>
