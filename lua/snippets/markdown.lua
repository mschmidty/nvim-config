local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("markdown", {
	s("elevstart", {
		t({ "---", "layout: post", "title:" }),
		i(1, " Your Title"),
		t({ "", "date: " }),
		i(2, os.date("%Y-%m-%d")),
		t({ "", "tags: [" }),
		i(3, ""),
		t({ "]" }),
		t({ "", "---" }),
	}),
})
