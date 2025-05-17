return {
  "github/copilot.vim",
  config = function()
      -- Set custom keybinding for Copilot
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-q>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end
}
