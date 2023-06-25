local on_attach = function(client, bufnr)
  vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.format()")
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "df", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<space>rf", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>fmt", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.offsetEncoding = 'utf-16'

local opt = {
  -- Function executed when the LSP server startup
  on_attach = on_attach,
  --lsp_flags
  lsp_flags = {
    debounce_text_changes = 150,
  },
  --capabilities
  capabilities = capabilities
}

require("mason").setup()
require("mason-lspconfig").setup_handlers({
  function(server)
    require("lspconfig")[server].setup(opt)
  end,
})
require("lspconfig")["texlab"].setup {}
require("mason-lspconfig").setup()


require("mason-null-ls").setup({})

local null_ls = require("null-ls")
local py_source = {
  null_ls.builtins.formatting.autopep8,
}
local c_source = {
  null_ls.builtins.formatting.clang_format,
  null_ls.builtins.formatting.cmake_format,
}
local web_source = {
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.diagnostics.markdownlint,
}
-- local sources = { py_source, c_source, web_source, tex_source }

null_ls.setup()
null_ls.register(py_source)
null_ls.register(c_source)
null_ls.register(web_source)

require("fidget").setup()

-- diagnostic
-- setting
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  float = false,
  update_in_insert = true,
  severity_sort = true,
})

-- diagnostic mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>E", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- print diagnostics in floating window
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- setting nvim-cmp
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
