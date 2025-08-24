return {
  "echasnovski/mini.surround",
  version = "*",
  opts = {
    mappings = {
      add = "as", -- Add surrounding in Normal and Visual modes
      delete = "ds", -- Delete surrounding
      find = "ysf", -- Find surrounding (to the right)
      find_left = "ysF", -- Find surrounding (to the left)
      highlight = "hs", -- Highlight surrounding
      replace = "cs", -- Replace surrounding
      update_n_lines = "dsn", -- Update `n_lines`

      suffix_last = "dl", -- Suffix to search with "prev" method
      suffix_next = "dn", -- Suffix to search with "next" method
    },
  },
}
