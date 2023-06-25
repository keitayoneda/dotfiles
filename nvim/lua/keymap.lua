local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '
map('i', 'jj', '<ESC>:w<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>W', ':wq<CR>')
map('n', '<leader>Q', ':q!<CR>')
map('n', '<leader>h', ':set hlsearch!<CR>')
map('n', '<Tab>', ':bn<CR>')
map('n', '<S-Tab>', ':bp<CR>')
map('n', '<leader>x', ':bw<CR>')
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('n', '<Down>', 'gj')
map('n', '<Up>', 'gk')
map('i', '<Down>', '<C-o>gj')
map('i', '<Up>', '<C-o>gk')

map('n', '<leader>fp', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
map('n', '<leader>fc', ':Telescope commands<CR>')
map('n', '<leader>fm', ':Telescope marks<CR>')
map('n', '<leader>fr', ':Telescope registers<CR>')
map('n', '<leader>ft', ':Telescope treesitter<CR>')
map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')

map('n', '<leader>gdiff', ':GitGutterDiffOrig<CR>')
map('n', '<leader>h[', ':GitGutterNextHunk<CR>')
map('n', '<leader>h]', ':GitGutterPrevHunk<CR>')

map('n', '<leader>md', ':MarkdownPreviewToggle<CR>')
