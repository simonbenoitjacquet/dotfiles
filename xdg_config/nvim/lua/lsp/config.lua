local M = {}

-- Only install the Lua LSP by default.
-- To install others take a look at :LspInstallInfo
M.servers = {
  'sumneko_lua',
  'pyright',
}

M.settings = {
  Lua = {
    diagnostics = {
      globals = { 'vim' }
    }
  },
  python = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "workspace",
      useLibraryCodeForTypes = true
    }
  }
}

return M
