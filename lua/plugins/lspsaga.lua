return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            --[[
                code_action_keys = {
                quit = '<esc>', -- 退出快捷键
                exec = '<CR>'   -- 执行选中项的快捷键
            },
            --]]
            finder = {
                keys = {
                    vsplit = 'v',
                    split = 's',
                    close = '<esc>',
                    --[[
                        shuttle = '[w' shuttle bettween the finder layout window
                        toggle_or_open = 'o' toggle expand or open
                        vsplit = 's' open in vsplit
                        split = 'i' open in split
                        tabe = 't' open in tabe
                        tabnew = 'r' open in new tab
                        quit = 'q' quit the finder, only works in layout left window
                        close = '<C-c>k' close finder
                    --]]
                }
            }

        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}
