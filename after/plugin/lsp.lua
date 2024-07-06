local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

-- Setup mason
mason.setup()

-- Setup mason-lspconfig
mason_lspconfig.setup{
  ensure_installed = { 'tsserver', 'gopls', 'eslint','pyright', 'pylsp' },
}

-- Capabilities from nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup specific language server configurations
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.eslint.setup({
  --- ...
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

