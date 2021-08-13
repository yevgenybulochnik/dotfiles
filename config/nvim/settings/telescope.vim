lua << EOF
require('telescope').load_extension('coc')

local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_next,
        ["<C-j>"] = actions.move_selection_previous,
      },
    },
  }
}
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>sd <cmd>Telescope coc diagnostics<cr>
nnoremap <leader>fr <cmd>Telescope coc references<cr>

nnoremap <leader>sc <cmd>Telescope git_commits<cr>
nnoremap <leader>sb <cmd>Telescope git_branches<cr>
