-- General vim settings.
vim.opt.mouse = 'a' -- Enable mouse usage.

-- Display settings.
vim.opt.background = 'dark' -- Set to dark mode.
vim.opt.wrap = false -- Disable line wrap.
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show distance to lines
vim.opt.termguicolors = true -- Match terminal colors with GUI program.
vim.opt.wrap = false -- Lines do not wrap around when too long.
vim.opt.signcolumn = 'yes' -- Column showing when a line is too long.
vim.opt.colorcolumn = '80' -- Column inded of signcolumn
-- vim.opt.cmdheight = 1 -- Height of the command bar
vim.cmd 'syntax on'

-- Indentation settings
vim.opt.tabstop = 4 -- Make tabs 4 characters wide.
vim.opt.softtabstop = 4 -- Make tabs 4 characters wide.
vim.opt.shiftwidth = 4 -- Indent by 4 spaces by default.
vim.opt.expandtab = true -- Pressing tab converts to spaces.
vim.opt.smartindent = true -- When making a new line, puts the cursor at the expected indentation.

-- Search settings.
vim.opt.ignorecase = true -- Ignore case sensitivity.
vim.opt.smartcase = true -- Check case for queries with uppercase letters.
vim.opt.hlsearch = false -- Remove highlight matching.
vim.opt.incsearch = true -- Hightlights searched text incrementally.

-- Miscanecellous
vim.opt.errorbells = false -- Remove bell sound when errors.
vim.cmd "set path+=**"
-- vim.opt.completeopt = ['menuone', 'noinsert', 'noselect', 'preview'] -- Options to see for completion

-- Buffer stuff
vim.opt.hidden = true -- Out of sight buffers are hidden and not deleted.
vim.opt.swapfile = false -- For buffers.
vim.opt.backup = false -- For buffers.
vim.opt.undodir = vim.fn.expand('~') .. '/.vim/undodir' -- The directory for all undo of files.
vim.opt.undofile = true -- Use files to remember undo commands.

-- Return to last edit position when opening files.
vim.cmd[[
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
]]
