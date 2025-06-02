local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippet = { s("cp", {
    t({ "#include <bits/stdc++.h>",
        "using namespace std;",
        "",
        "int main() {",
        "\tstd::ios::sync_with_stdio(false);",
        "\tstd::cin.tie(nullptr);",
        "\tstd::cout.tie(nullptr);",
        "\t" }),
    i(1),
    t({ "",
        "}" })
}
)
}
return snippet
