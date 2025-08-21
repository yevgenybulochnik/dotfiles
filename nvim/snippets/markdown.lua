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

local markdown_cell_types = {
  { trig = "mcpy", celltype = "python" },
  { trig = "mcsql", celltype = "sql" },
  { trig = "mcbash", celltype = "bash" },
}

local snippets_table = {}

for _, v in ipairs(markdown_cell_types) do
  table.insert(
    snippets_table,
    s(
      { trig = v.trig, snippetType = "autosnippet" },
      fmta(
        [[
          ```<>
          <>
          ```
        ]],
        { v.celltype, i(0) }
      )
    )
  )
end

table.insert(
  snippets_table,
  s(
    { trig = "mcmo", snippetType = "autosnippet" },
    fmta(
      [[
        ```python {.marimo}
        <>
        ```
      ]],
      { i(0) }
    )
  )
)

return snippets_table
