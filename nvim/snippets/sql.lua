local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local snippts_table = {
  s(
    { trig = "for" },
    fmta(
      [[
        {% for <> in <> %}
          <>
        {% endfor %}
      ]],
      { i(1, "item"), i(2, "collection"), i(3, "statment") }
    )
  ),
  s(
    { trig = "if" },
    fmta(
      [[
        {% if <> %}
          <>
        {% endif %}
      ]],
      { i(1, "condition"), i(2, "statement") }
    )
  ),
}

return snippts_table
