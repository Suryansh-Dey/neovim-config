local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local snippet = { s("cp", fmt([[
#include <bits/stdc++.h>
#include <ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>
using namespace std;
using namespace __gnu_pbds;
template <typename T>
using Oset = tree<T, null_type, less<T>, rb_tree_tag, tree_order_statistics_node_update>;
template <typename T>
using Omset = tree<T, null_type, less_equal<T>, rb_tree_tag, tree_order_statistics_node_update>;
constexpr int M = 1000000007;
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
