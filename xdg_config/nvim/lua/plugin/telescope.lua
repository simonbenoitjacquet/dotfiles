local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local state =   require('telescope.actions.state')
local lga_actions = require("telescope-live-grep-args.actions")

-- Setup
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = 'move_selection_next',
        ["<C-k>"] = 'move_selection_previous',
      },
    }
  },
  pickers = {
      current_buffer_fuzzy_find = {
          prompt_position = "top",
          sorting_strategy = "ascending",
      },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-l>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('live_grep_args')

-- Custorm functions
local custom = {}

-- Fuzzy find directories, cd to them on <cr>
custom.switch_directory = function()
  local target = builtin.find_files{
    find_command={
      "/usr/bin/fdfind",
      "--hidden",
      "--type", "d",
      "--ignore-file", "~/.gitignore",
      "--ignore-file", "~/.fdignore",
    },
    attach_mappings = function(_, map)
      map({"i", "n"}, "<cr>", function(prompt_bufnr)
        local entry = state.get_selected_entry()
        local dir = entry[1]
        vim.cmd("cd " .. dir)
        actions.close(prompt_bufnr)
      end)
      return true
    end
  }
  print(target)
end

-- Fuzzy find files in neovim config directory
custom.search_config = function()
  builtin.find_files{ cwd="~/.config/nvim" }
end

custom.Find_files = function()
  builtin.find_files{ no_ignore=true }
end

custom.Live_grep = function()
  telescope.extensions.live_grep_args.live_grep_args()
end

return custom
