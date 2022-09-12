local hop_status_ok, hop = pcall(require, 'hop')
if not hop_status_ok then
  return
end

hop.setup {

}

local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>h', ':HopChar1MW<CR>', { noremap = true, silent = true })
keymap('n', '<leader>vh', ':HopLine<CR>', { noremap = true, silent = true })
