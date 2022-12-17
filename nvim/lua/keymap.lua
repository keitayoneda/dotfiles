vim.cmd [[
	let mapleader="\<Space>"
	inoremap jj <ESC>:w<CR>
	nnoremap <Tab> :bn<CR>
	nnoremap <S-Tab> :bp<CR>
	nnoremap <Leader>x :bw<CR>

    nnoremap j gj
    nnoremap k gk
    nnoremap <Down> gj
    nnoremap <Up> gk
    inoremap <Down> <C-o>gj
    inoremap <Up> <C-o>gk
    

	nnoremap <Leader>ff :Telescope find_files<CR>
	nnoremap <leader>fg <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
	nnoremap <leader>fh <cmd>Telescope help_tags<cr>
	]]
