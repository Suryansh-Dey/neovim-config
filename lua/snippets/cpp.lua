local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippet = { s("cp", {
    t({ "#include <bits/stdc++.h>",
        "using namespace std;",
        "#define int long long int",
        "",
        "signed main() {",
        "\tstd::ios::sync_with_stdio(false);",
        "\tstd::cin.tie(nullptr);",
        "\tstd::cout.tie(nullptr);",
        "\tint tc;",
        "\tcin>>tc;",
        "\twhile(tc--) {",
        "\t\t" }),
    i(0),
    t({ "",
        "\t}",
        "}" })
}
),
    s("fr", {
        t("for(int i=0;i<"), i(1), t(";i++) {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" })
    })
}
return snippet
