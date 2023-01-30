-- Python files have tabs of 4 spaces
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

-- =============================== Jupyter notebook ===============================
-- TODO: put in a separate file

vim.api.nvim_command([[
augroup AutoSyncNotebooksOnSave
autocmd BufReadPre *.sync.py :silent call jobstart('jupyter notebook '.expand('%:r').'.ipynb')
autocmd BufWritePost *.sync.py :silent !python3 -m jupyter_ascending.requests.sync --filename %
augroup END 
]])

local add_blank_line_below = ':<c-u>call append(line("."),   repeat([""], v:count1))<CR>'
local add_blank_line_above = ':<c-u>call append(line(".")-1, repeat([""], v:count1))<CR>'

local go_next_cell = [[/^# %%\|\%$/<cr>]]
local go_prev_cell = [[?^# %%\|\%^?<cr>]]
vim.keymap.set('n', '<leader>jj', go_next_cell)
vim.keymap.set('n', '<leader>jk', go_prev_cell)

local execute_cell = [[:silent lua vim.cmd("!python3 -m jupyter_ascending.requests.execute --filename % --line "..vim.fn.line('.'))<cr>]]
local execute_all_cells = [[:silent !python3 -m jupyter_ascending.requests.execute_all --filename %<cr>]]
vim.keymap.set('n', '<leader>jx', execute_cell)
vim.keymap.set('n', '<leader>jX', execute_all_cells)

local create_pair_nb_py = [[:silent let fname = input('Notebook name: ') | execute '!python3 -m jupyter_ascending.scripts.make_pair --base ' . fname<cr>]]
local open_paired_nb = [[:silent call jobstart('jupyter notebook '.expand('%:r').'.ipynb')<cr>]]
vim.keymap.set('n', '<leader>jn', create_pair_nb_py)
vim.keymap.set('n', '<leader>jo', open_paired_nb)

local add_cell_above = go_prev_cell .. [[:call append(line('.')-1, '# %%')<cr>]] .. add_blank_line_above .. add_blank_line_above .. 'j'
local add_cell_below = [[/\n^# %%\|\%$/<cr>]] .. add_blank_line_below .. add_blank_line_below .. [[:call append(line('.')  , '# %%')<cr>]] .. 'jj'
local add_new_cell = add_blank_line_above .. add_blank_line_above .. [[:call append(line('.')-1, '# %%')<cr>]]
vim.keymap.set('n', '<leader>ja', add_cell_above)
vim.keymap.set('n', '<leader>jb', add_cell_below)
vim.keymap.set('n', '<leader>jc', add_new_cell)

local restart_kernel = [[:silent !python3 -m jupyter_ascending.requests.restart --filename %<cr>]]
vim.keymap.set('n', '<leader>jr', restart_kernel)
