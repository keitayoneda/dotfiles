vim.cmd [[
    set number
    set expandtab
    set shiftwidth=4
    set tabstop=4
    set mouse=a
]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[colorscheme tender]])
