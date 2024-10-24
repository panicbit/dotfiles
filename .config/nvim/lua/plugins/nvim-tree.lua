return {
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            sync_root_with_cwd = true,
            sort = {
                files_first = true,
            },
            view = {
                side = 'right',
            },
        },
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
    }
}
