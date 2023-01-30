vim.api.nvim_create_augroup('ftconfig', {})

-- Return to last edit
vim.api.nvim_create_autocmd('BufEnter', {
  group    = 'ftconfig',
  pattern  = '*',
  callback = function()
    local filetype = vim.bo.filetype
    pcall(require, "ftconfig." .. filetype)
  end
})

