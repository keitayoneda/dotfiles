vim.o.number = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.mouse = a

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[colorscheme tender]])
