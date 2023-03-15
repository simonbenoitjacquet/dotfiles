require("mason").setup()
require("mason-lspconfig").setup{
  ensure_installed = {
    "lua_ls",
    "pyright",
    "rust_analyzer",
  }
}

local function on_attach(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- Regular lsp stuff
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- Diagnostics bindings
  buf_set_keymap('n', '<leader>dl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<leader>dq', '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)
  -- 3 ways to do next diagnostic
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>dk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  -- 3 ways to do previous diagnostic
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>dj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  require('lsp_signature').on_attach()
end

local lspconfig = require'lspconfig'
lspconfig.lua_ls.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    }
  },
  on_attach = on_attach,
}
lspconfig.pyright.setup{
  analysis = {
    autoSearchPaths = true,
    diagnosticMode = "workspace",
    useLibraryCodeForTypes = true
  },
  on_attach = on_attach,
}
lspconfig.rust_analyzer.setup{
  on_attach = on_attach,
}
lspconfig.phpactor.setup{
  on_attach = on_attach,
}

