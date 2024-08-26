local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt


ls.add_snippets("rmd", {
  s("rc", {
    fmt("```{r}\n {}\n```")
  })
})

ls.snippets.qmd = ls.snippets.rmd
