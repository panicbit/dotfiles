return {
    {
        "yamatsum/nvim-cursorline",
        enabled = true,
        opts = {
            cursorline = {
                enable = false,
            },
            cursorword = {
                enable = false,
                min_length = 3,
                hl = {
                    underline = true,
                },
            }
        }
    }
}
