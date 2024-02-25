local indent_blankline_status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not indent_blankline_status_ok then
  return
end
-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"

vim.g.indent_blankline_filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
}
