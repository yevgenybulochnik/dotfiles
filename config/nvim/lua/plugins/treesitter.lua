local treesitter_status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not treesitter_status_ok then
  return
end

treesitter.setup {
  ensure_installed = {'lua', 'typescript', 'go', 'python', 'tsx'},
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
