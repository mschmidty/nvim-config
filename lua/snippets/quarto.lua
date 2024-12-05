local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("quarto", {
	s("qmdtomd", {
		t({ "---", "title:" }),
		i(1, "Your Title"),
		t({ "", "date: " }),
		i(2, os.date("%Y-%m-%d")),
		t({ "", "tags: [" }),
		i(3, ""),
		t({ "]", "" }),
		t({ "format: " }),
		t({ "", "  commonmark:" }),
		t({ "", "    keep-yaml: true" }),
		t({ "", "    df-print: tibble" }),
		t({ "", "execute:" }),
		t({ "", "  echo: true" }),
		t({ "", "  message: false" }),
		t({ "", "  warning: false" }),
		t({ "", "  class-output: 'r'" }),
		t({ "", "---" }),
	}),
})
