local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then
  return
end

local actions = require('telescope.actions')
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}

telescope.setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
  pickers = {
    buffers = {
      sort_lastused = true,
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", default_opts)
map('n', '<leader>;', "<cmd>lua require'telescope.builtin'.buffers{}<cr>", default_opts)
map('n', '<leader>d', "<cmd>lua require'telescope.builtin'.diagnostics{bufnr=0}<cr>", default_opts)
map('n', '<leader>gc', "<cmd>lua require'telescope.builtin'.git_commits{}<cr>", default_opts)
map('n', '<leader>gb', "<cmd>lua require'telescope.builtin'.git_branches{}<cr>", default_opts)
