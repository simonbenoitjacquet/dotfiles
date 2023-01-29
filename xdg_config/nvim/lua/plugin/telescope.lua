local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = 'move_selection_next',
        ["<C-k>"] = 'move_selection_previous',
      }
    }
  },
  pickers = {
      current_buffer_fuzzy_find = {
          prompt_position = "top",
          sorting_strategy = "ascending",
      },
  },
}

telescope.load_extension('fzf')

local mappings = {}

mappings.current_buffer_fuzzy_find = function()
    builtin.current_buffer_fuzzy_find()
end
mappings.builtin = function()
    builtin.builtin()
end
mappings.keymaps = function()
    builtin.keymaps()
end
mappings.buffers = function()
    builtin.buffers()
end
mappings.oldfiles = function()
    builtin.oldfiles()
end
mappings.find_files = function()
    builtin.find_files()
end
mappings.live_grep = function()
    builtin.live_grep()
end
mappings.resume = function()
    builtin.resume()
end
mappings.git_files = function()
    builtin.git_files()
end



return mappings
