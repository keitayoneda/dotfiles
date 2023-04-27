vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.mouse = a
vim.o.noswapfile = true
vim.o.termguicolors = true
-- vim.o.clipboard = { "unnamedplus" }

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd "colorscheme gruvbox"
vim.cmd "set clipboard=unnamedplus"
