local null_ls = require("null-ls")

-- Register Prettier as a formatter
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ bufnr = bufnr })")
    end
  end,
})

-- Set up Prettier
require('prettier').setup({
  bin = 'prettier', -- or `prettierd` for the daemon
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "json",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

