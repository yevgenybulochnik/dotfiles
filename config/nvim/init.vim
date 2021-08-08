source ~/.config/nvim/plugins.vim

" ColorScheme settings
silent! colorscheme gruvbox
set background=dark
silent! highlight EndOfBuffer ctermfg=bg

" General Settings
let mapleader=',' " remapped <leader> from \
set number
set updatetime=250 " update time to 250ms so git gutter auto updates faster
set breakindent
nnoremap <leader>es :source $MYVIMRC<CR>

" Global tab settings
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=4

" Search & highlight settings
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Misc Keybindings
inoremap <expr> <c-j> ("\<C-n>") " omnicomplete movement
inoremap <expr> <c-k> ("\<C-p>")

" Source all setting files
for fpath in split(glob('~/.config/nvim/settings/*.vim', '\n'))
    exe 'source' fpath
endfor
