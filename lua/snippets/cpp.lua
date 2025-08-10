local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local snippet = { s("cp", fmt([[
#include <bits/stdc++.h>
using namespace std;
#define int long long

void solve() {{
    {}
}}

signed main() {{
    std::ios::sync_with_stdio(false);
    std::cin.tie(nullptr);
    std::cout.tie(nullptr);
    int tc;
    cin >> tc;
    while (tc--)
        solve();
}}
]], {
    i(0)
})
),
    s("fr", {
        t("for(int i=0;i<"), i(1), t(";i++) {"),
        t({ "", "\t" }), i(0),
        t({ "", "}" })
    })
}
return snippet
