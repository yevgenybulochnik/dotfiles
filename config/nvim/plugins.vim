call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
Plug 'jiangmiao/auto-pairs' " auto complete [{()}]
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intelisense Engine
Plug 'scrooloose/nerdcommenter' " better commenting
Plug 'ntpeters/vim-better-whitespace' " Show Whitespace
Plug 'tpope/vim-surround'

" === UI === "
Plug 'morhetz/gruvbox' " Colorscheme
Plug 'scrooloose/nerdtree' " File explorer
Plug 'vim-airline/vim-airline' " Vim status line
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter' " git diff support
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } " adjustable floating window
Plug 'simnalamburt/vim-mundo' " Visual undo tree

" === Syntax === "
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" === Misc === "
Plug 'tpope/vim-fugitive' " add git control to vim

call plug#end()
