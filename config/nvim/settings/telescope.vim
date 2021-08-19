lua << EOF
require('telescope').load_extension('coc')

local actions = require('telescope.actions')
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  }
}
map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", default_opts)
EOF

" nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>sd <cmd>Telescope coc diagnostics<cr>
nnoremap <leader>fr <cmd>Telescope coc references<cr>

nnoremap <leader>sc <cmd>Telescope git_commits<cr>
nnoremap <leader>sb <cmd>Telescope git_branches<cr>
