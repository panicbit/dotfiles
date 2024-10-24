return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { 'rust', 'nu', 'lua', 'python' },
                highlight = {
                    enable = true,
                },
            }
        end,
    }
}
