-- Mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Unbind mapleader
vim.keymap.set('n', '<leader>', '<nop>')
vim.keymap.set('i', 'jk', '<esc>')

-- Maps for convenience
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move highlighted text down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move highlighted text up
vim.keymap.set({"n", "v"}, '<leader>w', '<cmd>w<cr>') -- Write to file
vim.keymap.set({"n", "v"}, '<leader>q', '<cmd>q<cr>') -- Quit
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d") -- Delete into void registry
vim.keymap.set({"n", "v"}, "<leader>D", "\"_D") -- Delete into void registry
vim.keymap.set({"n", "v"}, '<leader>p', '"+p') -- Paste from system clipboard
vim.keymap.set({"n", "v"}, '<leader>P', '"+P') -- Paste from system clipboard
vim.keymap.set({"n", "v"}, '<leader>y', '"+y') -- Yank to system clipboard
vim.keymap.set({"n", "v"}, '<leader>Y', '"+Y') -- Yank to system clipboard
vim.keymap.set({"n", "v"}, '<leader>o',
  ':<c-u>call append(line("."),   repeat([""], v:count1))<cr>') -- Create blank line below cursor
vim.keymap.set({"n", "v"}, '<leader>O',
  ':<c-u>call append(line(".")-1, repeat([""], v:count1))<cr>') -- Create blank line above cursor

-- Buffers
vim.keymap.set('n', '<leader>bj', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>bk', '<cmd>bprev<cr>')
vim.keymap.set('n', '<leader>bn', '<cmd>enew<cr>')

-- Tabs
vim.keymap.set('n', '<leader>tj', '<cmd>tabnext<cr>')
vim.keymap.set('n', '<leader>tk', '<cmd>tabprev<cr>')
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<cr>')
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>')

-- Telescope
local builtin = require('telescope.builtin')
local custom = require('plugin.telescope')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fo', builtin.oldfiles)
vim.keymap.set('n', '<leader>fg', builtin.git_files)
vim.keymap.set('n', '<leader>fl', builtin.live_grep)
vim.keymap.set('n', '<leader>fk', builtin.keymaps)
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>ft', builtin.builtin)
vim.keymap.set('n', '<leader>fd', custom.switch_directory)
vim.keymap.set('n', '<leader>fi', custom.search_config)

-- Nerdtree
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>i', ':NvimTreeOpen ~/.config/nvim<cr>') -- Go to init file

-- Source files
vim.keymap.set('n', '<leader>sc', '<cmd>source %<cr>') -- Source current file
-- TODO: resource all files
