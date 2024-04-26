return {
	"nvim-tree/nvim-tree.lua",
	config=function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		-- empty setup using defaults
		require("nvim-tree").setup()

		local api = require("nvim-tree.api")
		vim.keymap.set("n", "<Leader>e", api.tree.toggle, {})
	end
}

