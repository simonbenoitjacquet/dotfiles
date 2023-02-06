require("mason").setup()
require("mason-lspconfig").setup{
  ensure_installed = {
    "sumneko_lua",
    "pyright",
    "rust_analyzer",
  }
}

local lspconfig = require'lspconfig'
lspconfig.sumneko_lua.setup{
    diagnostics = {
      globals = { 'vim' }
    }
}
lspconfig.pyright.setup{
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "workspace",
      useLibraryCodeForTypes = true
    }
}
lspconfig.rust_analyzer.setup{ }
lspconfig.intelephense.setup{ }
