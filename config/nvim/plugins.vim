call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
Plug 'jiangmiao/auto-pairs' "auto complete [{()}]
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intelisense Engine
Plug 'scrooloose/nerdcommenter' "better commenting

" === UI === "
Plug 'morhetz/gruvbox' " Colorscheme
Plug 'scrooloose/nerdtree' " File explorer
Plug 'vim-airline/vim-airline' " Vim status line
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter' "git diff support

" === Misc === "
Plug 'tpope/vim-fugitive' "add git control to vim

call plug#end()
