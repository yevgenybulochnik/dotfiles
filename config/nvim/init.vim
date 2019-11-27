source ~/.config/nvim/plugins.vim

" ColorScheme settings
silent! colorscheme gruvbox
set background=dark
silent! highlight EndOfBuffer ctermfg=bg

let mapleader=',' "remapped <leader> from \
set number

"set encoding=utf-8
set updatetime=250 "update time to 250ms so git gutter auto updates faster
set breakindent

" Source all setting files
for fpath in split(glob('~/.config/nvim/settings/*.vim', '\n'))
    exe 'source' fpath
endfor
