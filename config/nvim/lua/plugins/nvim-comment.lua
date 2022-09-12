local comment_status_ok, comment = pcall(require, 'nvim_comment')
if not comment_status_ok then
  return
end

comment.setup {
}
