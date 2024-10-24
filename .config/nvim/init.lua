require("config.lazy")

vim.opt.termguicolors = true
vim.cmd("colorscheme 1337")

--require('onedark').load()
--local tree = require('nvim-tree.api').tree

--vim.cmd('NvimTreeOpen')

vim.keymap.set('n', '<c-n>', ':NvimTreeToggle<cr>')

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'both'

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

vim.opt.wildmode = "longest,list"

vim.opt.shell = 'nu'
vim.opt.shellcmdflag = '-c'
vim.opt.shellquote = ''
vim.opt.shellxquote = ''

vim.keymap.set('n', '<c-p>', ':Telescope fd<cr>')

--[[
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'nu', 'nuon'},
    callback = function(args)
    vim.lsp.start({
        name = 'nu-lsp',
        cmd = {'nu', '--lsp'},
        root_dir = vim.fs.root(args.buf, {args.file}),
    })
    end,
})
]]
