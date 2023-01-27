local line_ok, feline = pcall(require, "feline")
if not line_ok then
	return
end

local one_monokai = {
    fg = '#a89984',
    bg = '#282828',
    black = '#282828',
    yellow = '#d8a657',
    cyan = '#89b482',
    oceanblue = '#282828',
    green = '#a9b665',
    orange = '#e78a4e',
    violet = '#d3869b',
    magenta = '#c14a4a',
    white = '#a89984',
    red = '#ea6962',
    skyblue = '#7daea3',

	purple = "#c678dd",
	peanut = "#f6d5a4",
	aqua = "#61afef",
	darkblue = "#282c34",
	dark_red = "#f75f5f",
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "yellow",
	VISUAL = "purple",
	LINES = "orange",
	BLOCK = "dark_red",
	REPLACE = "red",
	COMMAND = "aqua",
}
local c = {
	vim_mode = {
        icon = "",
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
				-- padding = "center", -- Uncomment for extra padding.
			},
		},
		hl = function()
			return {
				fg = require("feline.providers.vi_mode").get_mode_color(),
				bg = "bg",
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = " ",
		right_sep = " ",
	},
	gitBranch = {
		provider = "git_branch",
        icon = "",
		hl = {
            fg = "peanut",
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
        icon = "+",
		hl = {
			fg = "green",
		},
		left_sep = "",
		right_sep = " ",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
        icon = "-",
		hl = {
			fg = "red",
		},
		left_sep = "",
		right_sep = " ",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
        icon = "~",
		hl = {
			fg = "orange",
		},
		left_sep = "",
		right_sep = " ",
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative-short",
                file_modified_icon = "*",
                file_readonly_icon = "<READONLY> ",
			},
		},
        icon = "",
		hl = {
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
	wb_fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative",
                file_modified_icon = "*",
                file_readonly_icon = "<READONLY> ",
			},
		},
        icon = "",
		hl = {
			style = "bold",
            bg = "none",
		},
		left_sep  = { str = " ", hl = { bg = "none" }, },
		right_sep = { str = " ", hl = { bg = "none" }, },
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
        icon = "X",
		hl = {
			fg = "red",
		},
		left_sep = "",
		right_sep = " ",
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
        icon = "?",
		hl = {
			fg = "yellow",
		},
		left_sep = "",
		right_sep = " ",
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
        icon = "!",
		hl = {
			fg = "aqua",
		},
		left_sep = "",
		right_sep = " ",
	},
	diagnostic_info = {
		provider = "diagnostic_info",
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				case = "lowercase",
			},
		},
		hl = {
			fg = "purple",
			style = "bold",
		},
		left_sep = " ",
		right_sep = "",
	},
	lsp_client_names = {
		provider = function ()
            local fun = function()
              local clients = vim.lsp.buf_get_clients()
              if #clients == 0 then
                return "no lsp"
              elseif #clients > 1 then
                return tostring(#clients) .. " clients"
              else
                return clients[1].name
              end
            end
            return "(" .. fun() .. ")"
		end,
        icon = "",
		hl = {
			fg = "purple",
			style = "italic",
		},
		left_sep = "",
		right_sep = " ",
	},
	position = {
        provider = function ()
            local line, _ = unpack(vim.api.nvim_win_get_cursor(0))
            local lines = vim.api.nvim_buf_line_count(0)
            return tostring(line) .. "/" .. tostring(lines)
        end,
		hl = {
			fg = "green",
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
	scroll_bar = {
		provider = "scroll_bar",
		hl = {
			fg = "yellow",
			style = "bold",
		},
	},
}

local left = {
	c.vim_mode,
	c.gitBranch,
	c.gitDiffAdded,
    c.gitDiffRemoved,
	c.gitDiffChanged,
}

local middle = {
	c.fileinfo,
	c.diagnostic_errors,
	c.diagnostic_warnings,
	c.diagnostic_info,
	c.diagnostic_hints,
}

local right = {
	c.file_type,
	c.lsp_client_names,
	c.position,
	c.scroll_bar,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
		right,
	},
}

feline.setup({
	components = components,
	theme = one_monokai,
	vi_mode_colors = vi_mode_colors,
})

local wb_right = {
	c.wb_fileinfo,
}

local wb_components = {
	active = {
        {},
		wb_right,
	},
	inactive = {
        {},
		wb_right,
	},
}
feline.winbar.setup({
	components = wb_components,
})
