local ls = require "luasnip"
local events = require "luasnip.util.events"
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.s
local snippet_from_nodes = ls.sn

local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node


-- local str_snip = function(trig, expanded)
--   return ls.parser.parse_snippet({ trig = trig }, expanded)
-- end

local same = function(index)
  return f(function(args)
    return args[1]
  end, { index })
end


ls.add_snippets("all", {
    s("req", fmt("local {} = require('{}')", {i(1), i(2)})),
    s("fn", {
        t("def fun("),
        i(1, "x"),
        t({'):', '    return '}),
        same(1),
    }),
})

ls.add_snippets("markdown", {
    -- [Link](https://...)
    s("lk", {
        t("("),
        i(1, "Link"),
        t(")["),
        f(function ()
            return vim.fn.getreg('+')
        end),
        t("]"),
    }),
    -- Insert block of code in markdown
    s("code", {
        t({"```", ""}),
        i(0),
        t({" ", "```"}),
    }),
    -- Insert small code
    s("cd", {
        t("`"),
        i(1),
        t("`"),
        i(0),
    }),
})


