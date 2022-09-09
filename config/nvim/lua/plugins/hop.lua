require'hop'.setup {

}

local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>h', ':HopChar1MW<CR>', {noremap = true, silent = true})
keymap('n', '<leader>vh', ':HopLine<CR>', {noremap = true, silent = true})
