local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

local setup_arg = {
  on_attach,
  capabilities
}

lspconfig.ts_ls.setup(setup_arg)
lspconfig.clangd.setup({
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider=false
    on_attach(client, bufnr)
  end,
  capabilities
})
lspconfig.html.setup(setup_arg)
lspconfig.cssls.setup(setup_arg)
