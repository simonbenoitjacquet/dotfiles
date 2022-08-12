-- Abbreviate common commands.
vim.cmd 'command! PI PackerInstall'
vim.cmd 'command! PS PackerSync'
vim.cmd 'command! PST PackerStatus'
vim.cmd 'command! LSP LspInstall'
vim.cmd 'command! LS LspInstallInfo'

-- Alias most permutations of capitalized 'wqa' commands to work.
vim.cmd 'command! Q q'
vim.cmd 'command! W w'
vim.cmd 'command! WQ wq'
vim.cmd 'command! Wq wq'
vim.cmd 'command! WA wa'
vim.cmd 'command! Wa wa'
vim.cmd 'command! QA qa'
vim.cmd 'command! Qa qa'
vim.cmd 'command! Wqa wqa'
vim.cmd 'command! WQa wqa'
vim.cmd 'command! WQA wqa'

-- Remap s and S to hop around file.
require'hop'.setup()
local hop_search_before = ":lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>"
local hop_search_after  = ":lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>"
vim.api.nvim_set_keymap('n', 's', hop_search_after, { noremap = true })
vim.api.nvim_set_keymap('n', 'S', hop_search_before, { noremap = true })
vim.api.nvim_set_keymap('v', 's', hop_search_after, { noremap = true })
vim.api.nvim_set_keymap('v', 'S', hop_search_before, { noremap = true })

-- =============================== Map Leader ===============================
-- Define mapleader.
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader>', '<nop>', {})

-- Maps for convenience.
vim.api.nvim_set_keymap('n', '<leader>w', ':w<cr>', { noremap = true }) -- Write to file
vim.api.nvim_set_keymap('n', '<leader>q', ':q<cr>', { noremap = true }) -- Quit
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true }) -- Paste from system clipboard
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', { noremap = true }) -- Paste from system clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true }) -- Yank to system clipboard
vim.api.nvim_set_keymap('n', '<leader>o', ':<C-u>call append(line("."),   repeat([""], v:count1))<CR>', { noremap = true }) -- Create blank line below cursor
vim.api.nvim_set_keymap('n', '<leader>O', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', { noremap = true }) -- Create blank line after cursor

-- Maps for buffers.
vim.api.nvim_set_keymap('n', '<leader>bj', ':bnext<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bk', ':bprev<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bn', ':bnext<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':bprev<cr>', { noremap = true })

-- Maps for windows.
vim.api.nvim_set_keymap('n', '<leader>c', '<c-w>', { noremap = true })

-- Maps for Telescope.
vim.api.nvim_set_keymap('n', '<leader>tf', ':Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tg', ':Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tb', ':Telescope buffers<cr>', { noremap = true })

-- Maps to navigate files in a tree with NvimTreeToggle.
vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeToggle<CR>', { noremap = true })

-- Remap <ctrl-c> to <esc>. This prevents cmp-buffer from running into errors.
-- https://github.com/hrsh7th/cmp-buffer/issues/30#issuecomment-994011089
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>\\`^', { noremap = true })
