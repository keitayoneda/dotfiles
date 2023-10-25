require("jaq-nvim").setup {
	cmds = {
		external = {
			tex = "lualatex % --interaction=batchmode",
			python = "python3 %",
			cpp = "g++ -std=c++17 % -o main_tmp && ./main_tmp",
			c = "gcc % -o %< && ./%<",
		},
		behavior = {
			default = "float"
		},
		ui = {
			float = {
				height = 0.2,
				width = 1,
				x = 0.1,
				y = 0.5
			}
		}
	}
}

-- vim.api.nvim_create_autocmd("BufWritePre", { pattern = "*.tex", command = ":Jaq " })
