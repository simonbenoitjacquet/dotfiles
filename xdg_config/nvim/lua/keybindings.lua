-- Abbreviate common commands.
vim.cmd 'command! PI PackerInstall'
vim.cmd 'command! PS PackerSync'
vim.cmd 'command! PST PackerStatus'
vim.cmd 'command! LSP LspInstall'
vim.cmd 'command! LS LspInstallInfo'

-- Remap backspace to delete backwards like in insert mode
vim.keymap.set('n', '<BS>', 'hx')

-- =============================== Map Leader ===============================
-- ctrl maps not useful (can overwrite)
-- normal mode:
--CTRL-B CTRL-Y CTRL-F CTRL-E CTRL-H CTRL-J CTRL-K CTRL-L CTRL-M CTRL-N CTRL-P
--CTRL-Q CTRL-R CTRL-S

-- Define mapleader.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set('n', '<leader>', '<nop>')

-- Go to init file
vim.keymap.set('n', '<leader>i', ':NvimTreeOpen ~/.config/nvim<CR>')

-- Maps for convenience.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>') -- Write to file
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>') -- Quit
vim.keymap.set('n', '<leader>p', '"+p') -- Paste from system clipboard
vim.keymap.set('n', '<leader>P', '"+P') -- Paste from system clipboard
vim.keymap.set('n', '<leader>y', '"+y') -- Yank to system clipboard
vim.keymap.set('v', '<leader>y', '"+y') -- Yank to system clipboard
vim.keymap.set('n', '<leader>Y', '"+Y') -- Yank to system clipboard
vim.keymap.set('v', '<leader>Y', '"+Y') -- Yank to system clipboard

local add_blank_line_below = ':<c-u>call append(line("."),   repeat([""], v:count1))<CR>'
local add_blank_line_above = ':<c-u>call append(line(".")-1, repeat([""], v:count1))<CR>'
vim.keymap.set('n', '<leader>o', add_blank_line_below) -- Create blank line below cursor
vim.keymap.set('n', '<leader>O', add_blank_line_above) -- Create blank line after cursor

-- Maps for buffers.
vim.keymap.set('n', '<leader>bj', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>bk', '<cmd>bprev<cr>')
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>bp', '<cmd>bprev<cr>')

-- Maps for Telescope.
local telescope = require('plugin.telescope')
vim.keymap.set('n', '<c-_>', telescope.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>tt', telescope.builtin)
vim.keymap.set('n', '<leader>tk', telescope.keymaps)
vim.keymap.set('n', '<leader>tb', telescope.buffers)
vim.keymap.set('n', '<leader>tf', telescope.find_files)
vim.keymap.set('n', '<leader>f', telescope.find_files)
vim.keymap.set('n', '<leader>tl', telescope.live_grep)
vim.keymap.set('n', '<leader>to', telescope.oldfiles)
vim.keymap.set('n', '<leader>tr', telescope.resume)
vim.keymap.set('n', '<leader>gf', telescope.git_files)

-- Other possible mappings:
-- > grep_string git_files git_status pickers commands quickfix
-- > command_history help_tags reloader marks registers autocommands

-- Nerdtree
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<cr>')

-- Remap <ctrl-c> to <esc>. This prevents cmp-buffer from running into errors.
-- https://github.com/hrsh7th/cmp-buffer/issues/30#issuecomment-994011089
vim.keymap.set('i', '<C-c>', '<Esc>\\`^')
