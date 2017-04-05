set nocompatible 

"Setup vundle 
"For vundle to work, you must first use  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
filetype off "filetypes turned off initally for vundle setup

set rtp+=~/.vim/bundle/Vundle.vim "set vim runtime path to inclue vundle
call vundle#begin() "initialize vundle

	Plugin 'VundleVim/Vundle.vim' "have vundle manage vundle

	Plugin 'https://github.com/scrooloose/nerdtree.git' "nerdtree plugin

	Plugin 'https://github.com/airblade/vim-gitgutter.git' "git diff support 

call vundle#end()

filetype plugin indent on "turn filetype autodetection back on 
syntax on "turn syntax hilighting on

set tabstop=4
set shiftwidth=4 
set number
set updatetime=250 "update time to 250ms so git gutter auto updates faster

"NerdTree settings
let NERDTreeShowHidden=1 "force nerdtree to show hidden files
let NERDTreeIgnore = ['\.swp$'] "hide .swp files
map <F2> :NERDTreeToggle<CR>
