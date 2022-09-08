require('nvim-treesitter.configs').setup {
  ensure_installed = {'lua', 'typescript', 'go', 'python'},
  highlight = {
    enable = true,
    disable = {""},
  },
  indent = {
    enable = true,
    disable = {
      'yaml',
    },
  },
}
