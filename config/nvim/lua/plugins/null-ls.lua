local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

require'null-ls'.setup {
  sources = {
    formatting.black,
    diagnostics.flake8,
    formatting.stylua,
  },
}
