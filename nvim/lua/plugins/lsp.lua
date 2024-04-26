return {
  {
    "neovim/nvim-lspconfig"
  },
  {
    'williamboman/mason.nvim'
  },
  {
    'williamboman/mason-lspconfig.nvim',
		ensure_installed = {"clangd", "pyright"},
		automatic_installation = true,
		config=function ()
			local lspconfig = require("lspconfig")
			capabilities = require("cmp_nvim_lsp").default_capabilities()
			clangd_opt = {
				capabilities = capabilities
			}
			pyright_opt = {
				capabilities = capabilities
			}
			lspconfig["clangd"].setup({clangd_opt})
			lspconfig["pyright"].setup({pyright_opt})
			vim.api.nvim_create_autocmd("LspAttach", {
					callback = function(_)
						vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
						vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
						vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
						vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
						vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
						vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
						vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
						vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
						vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
						vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
						vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
						vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
					end
				})
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					--specify a snippet engine
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
})
		end
  },
}
