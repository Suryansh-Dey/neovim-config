local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

local setup_arg = {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.ts_ls.setup(setup_arg)
lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities
})
lspconfig.html.setup(setup_arg)
lspconfig.cssls.setup(setup_arg)
