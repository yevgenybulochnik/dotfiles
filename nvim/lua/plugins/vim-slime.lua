return {
    "jpalardy/vim-slime",
    init = function()
        vim.g.slime_no_mappings = 1
        vim.g.slime_target = 'tmux'
        vim.g.slime_bracketed_paste = 1
        vim.g.slime_no_mappings = 1
        vim.g.slime_dont_ask_default = 1
        vim.g.slime_default_config = {
            socket_name = "default",
            target_pane = "{last}"
        }
        vim.g.slime_cell_delimiter = '# %%'
    end,
    config = function()
        vim.keymap.set({'n', 'i'}, '<leader>sb', function()
            vim.cmd [[ call slime#send_cell()]]
        end, {desc = 'send code cell to terminal'})
    end
}
