-- Navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Use Escape key to exit insert mode
vim.keymap.set({ "n", "i", "v" }, "<C-[>", "<Esc>")

vim.keymap.set("n", "<leader>dv", function()
  vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
end, { desc = "Toggle virtual text" })

-- Obsidian keymaps
vim.keymap.set("n", "<leader>obt", ":Obsidian today<CR>", { desc = "Open today's note" })
vim.keymap.set("n", "<leader>obn", ":Obsidian new<CR>", { desc = "Create a new note" })
vim.keymap.set("n", "<leader>obs", ":Obsidian quick_switch<CR>", { desc = "Quick search obsidian notes" })

-- Luasnip keymaps
local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-L>", function()
  ls.expand_or_jump(1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-J>", function()
  ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

-- Codecompanion keymaps
vim.keymap.set({ "n" }, "<leader>cc", ":CodeCompanionChat<CR>", { desc = "Open Code Companion" })
vim.keymap.set({ "v" }, "<leader>cc", ":'<,'>CodeCompanionChat<CR>", { desc = "Open Code Companion" })

-- Aerial
vim.keymap.set("n", "<leader>oa", ":AerialToggle!<CR>", { desc = "Toggle Aerial" })
