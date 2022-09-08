local g = vim.g 	    -- Global variables
local opt = vim.opt 	-- Set options global

-- UI
opt.mouse = 'a'

-- Tabs, Indents
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
-- opt.smartindent = true

-- Line numbers
opt.number = true

-- Completion
opt.completeopt = {'menuone', 'noselect'}
