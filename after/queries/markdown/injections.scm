;; extends

; Parse Quarto/RMarkdown executable chunks like ```{r} or ```{r, echo=FALSE}
(fenced_code_block
  (info_string
    (language) @injection.language)
  (#lua-match? @injection.language "^{%a+")
  (#gsub! @injection.language "^{([%a%d_%-]+).*" "%1")
  (code_fence_content) @injection.content)
