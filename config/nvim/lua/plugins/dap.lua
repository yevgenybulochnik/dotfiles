local dap_status_ok, dap = pcall(require, 'dap')
if not dap_status_ok then
  return
end

local dapui_status_ok, dapui = pcall(require, 'dapui')
if not dapui_status_ok then
  return
end

local fn = vim.fn
local install_path = fn.stdpath('data')

dap.adapters.python = {
  type = 'executable',
  command = install_path..'/mason/packages/debugpy/venv/bin/python',
  args = { '-m', 'debugpy.adapter'}
}
dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    program = '${file}';
  }
}

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<cr>', opts)
map('n', '<leader>c', '<cmd>lua require"dap".continue()<cr>', opts)
map('n', '<leader>i', '<cmd>lua require"dap".step_into()<cr>', opts)
map('n', '<leader>o', '<cmd>lua require"dap".step_over()<cr>', opts)
