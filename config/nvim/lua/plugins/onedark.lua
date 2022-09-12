local onedark_status_ok, onedark = pcall(require, 'onedark')
if not onedark_status_ok then
  return
end

onedark.setup {
  style = 'deep',
}
onedark.load()
