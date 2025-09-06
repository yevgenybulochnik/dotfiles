return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      show_dir_path_in_prompt = true,
      file_name = function()
        local timestamp = os.date("%Y-%m-%d-%H-%M-%S")
        local current_file = vim.fn.expand("%:t:r")
        local default = timestamp .. "-" .. current_file
        local input = vim.fn.input({ prompt = "File name: ", default = default })
        return input
      end,
      prompt_for_file_name = false,
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
