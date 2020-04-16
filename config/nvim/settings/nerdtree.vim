" General Settings
let NERDTreeShowHidden = 1 "force nerdtree to show hidden files
let NERDTreeMinimalUI = 1 "hide Press ? for help
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" Key Bindings
map <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Auto close nerdtree if its the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
