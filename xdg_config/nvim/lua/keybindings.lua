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
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap('n', '<leader>', '<nop>', {})

-- Go to init file
vim.api.nvim_set_keymap('n', '<leader>i', ':NvimTreeOpen ~/.config/nvim<CR>', { noremap = true })

-- Maps for convenience.
vim.api.nvim_set_keymap('n', '<leader>w', ':w<cr>', { noremap = true }) -- Write to file
vim.api.nvim_set_keymap('n', '<leader>q', ':q<cr>', { noremap = true }) -- Quit
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true }) -- Paste from system clipboard
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', { noremap = true }) -- Paste from system clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true }) -- Yank to system clipboard

local add_blank_line_below = ':<c-u>call append(line("."),   repeat([""], v:count1))<CR>'
local add_blank_line_above = ':<c-u>call append(line(".")-1, repeat([""], v:count1))<CR>'
vim.api.nvim_set_keymap('n', '<leader>o', add_blank_line_below, { noremap = true }) -- Create blank line below cursor
vim.api.nvim_set_keymap('n', '<leader>O', add_blank_line_above, { noremap = true }) -- Create blank line after cursor

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

-- =============================== Jupyter notebook ===============================

local opts = { noremap=true, silent=true }

vim.api.nvim_command([[
augroup AutoSyncNotebooksOnSave
autocmd BufReadPre *.sync.py :silent call jobstart('jupyter notebook '.expand('%:r').'.ipynb')
autocmd BufWritePost *.sync.py :silent !python3 -m jupyter_ascending.requests.sync --filename %
augroup END 
]])

local go_next_cell = [[/^# %%\|\%$/<cr>]]
local go_prev_cell = [[?^# %%\|\%^?<cr>]]
vim.api.nvim_set_keymap('n', '<leader>jj', go_next_cell, opts)
vim.api.nvim_set_keymap('n', '<leader>jk', go_prev_cell, opts)

local execute_cell = [[:silent lua vim.cmd("!python3 -m jupyter_ascending.requests.execute --filename % --line "..vim.fn.line('.'))<cr>]]
local execute_all_cells = [[:silent !python3 -m jupyter_ascending.requests.execute_all --filename %<cr>]]
vim.api.nvim_set_keymap('n', '<leader>jx', execute_cell, opts)
vim.api.nvim_set_keymap('n', '<leader>jX', execute_all_cells, opts)

local create_pair_nb_py = [[:silent let fname = input('Notebook name: ') | execute '!python3 -m jupyter_ascending.scripts.make_pair --base ' . fname<cr>]]
local open_paired_nb = [[:silent call jobstart('jupyter notebook '.expand('%:r').'.ipynb')<cr>]]
vim.api.nvim_set_keymap('n', '<leader>jn', create_pair_nb_py, opts)
vim.api.nvim_set_keymap('n', '<leader>jo', open_paired_nb, opts)

local add_cell_above = go_prev_cell .. [[:call append(line('.')-1, '# %%')<cr>]] .. add_blank_line_above .. add_blank_line_above .. 'j'
local add_cell_below = [[/\n^# %%\|\%$/<cr>]] .. add_blank_line_below .. add_blank_line_below .. [[:call append(line('.')  , '# %%')<cr>]] .. 'jj'
local add_new_cell = add_blank_line_above .. add_blank_line_above .. [[:call append(line('.')-1, '# %%')<cr>]]
vim.api.nvim_set_keymap('n', '<leader>ja', add_cell_above, opts)
vim.api.nvim_set_keymap('n', '<leader>jb', add_cell_below, opts)
vim.api.nvim_set_keymap('n', '<leader>jc', add_new_cell, opts)

local restart_kernel = [[:silent !python3 -m jupyter_ascending.requests.restart --filename %<cr>]]
vim.api.nvim_set_keymap('n', '<leader>jr', restart_kernel, opts)
