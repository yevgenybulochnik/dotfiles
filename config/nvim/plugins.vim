call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
Plug 'jiangmiao/auto-pairs' " auto complete [{()}]
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intelisense Engine
Plug 'scrooloose/nerdcommenter' " better commenting
Plug 'ntpeters/vim-better-whitespace' " Show Whitespace
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'psf/black', {'branch': 'stable'}
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}
Plug 'szw/vim-maximizer'

" === UI === "
Plug 'morhetz/gruvbox' " Colorscheme
Plug 'scrooloose/nerdtree' " File explorer
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline' " Vim status line
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter' " git diff support
Plug 'simnalamburt/vim-mundo' " Visual undo tree
Plug 'nathanaelkane/vim-indent-guides' " Visual indents
Plug 'nvim-lua/popup.nvim' " Necessary for nvim-telescope
Plug 'nvim-telescope/telescope.nvim' " Extensible fuzzyfinder using lua
Plug 'fannheyward/telescope-coc.nvim' " Extension for telescope and coc

" === Productivity === "
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

" === Syntax === "
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" === Misc === "
Plug 'tpope/vim-fugitive' " add git control to vim
Plug 'junegunn/gv.vim' " git log graph
Plug 'nvim-lua/plenary.nvim' " Necessary for nvim-telescope but also custom plugins

call plug#end()

" === COC Extensions === "
let g:coc_global_extensions = [
    \ 'coc-pyright',
    \ 'coc-json',
    \ 'coc-snippets',
    \]
