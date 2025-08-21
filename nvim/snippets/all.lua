-- Basic LuaSnip snippet example
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Example autosnippet: expands "fn" into a Lua function template
return {
  s({ trig = "fn", snippetType = "autosnippet" }, {
    t("function "),
    i(1, "name"),
    t("()"),
    t({ "", "  " }),
    i(2, "-- body"),
    t({ "", "end" }),
  }),
}
