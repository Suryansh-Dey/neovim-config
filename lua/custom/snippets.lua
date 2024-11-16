local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", { s("cp", {
  t({ "#include \"../mySTL/mySTL.hpp\"",
    "using namespace std;",
    "int main() {",
    "#define int long long int",
    "\tstd::ios::sync_with_stdio(false);",
    "\tstd::cin.tie(nullptr);",
    "\tstd::cout.tie(nullptr);",
    "\t" }),
  i(1),
  t({ "", "\treturn 0;",
    "}" })
}
)
})
