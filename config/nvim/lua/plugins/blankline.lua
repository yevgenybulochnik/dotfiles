vim.opt.list = true
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

require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
}
