vim.o.number = true
vim.o.relativenumber = true
-- vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.mouse = a
vim.o.termguicolors = true

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd "colorscheme gruvbox"
vim.cmd "set clipboard+=unnamedplus"

vim.g.mkdp_auto_close = 0

vim.o.encoding = "utf-8"
vim.o.fileencodings = "utf-8"
