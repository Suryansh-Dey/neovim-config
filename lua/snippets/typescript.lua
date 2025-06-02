local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippet = {
  s("post", {
    t("fetch(\""),
    i(1),
    t({ "\", {",
      "\tmethod:\"POST\",",
      "\theaders: {",
      "\t\t\"Content-Type\": \"application/json;charset=UTF-8\"",
      "\t},",
      "\tbody:JSON.stringify({",
      "\t\t"
    }),
    i(2),
    t({ "", "\t})", "})" })
  })
}
return snippet
