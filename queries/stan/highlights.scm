; Comments
(comment) @comment

; Literals
(string_literal) @string
(integer_literal) @number
(real_literal) @number
; (imag_literal) @number

; Identifiers
(identifier) @variable

; Keywords
[
  "for"
  "while"
  "if"
  "else"
  "break"
  "continue"
  "return"
  ; "profile"
  "target"
  ; "jacobian"
] @keyword

; Built-in Functions
[
  "print"
  "reject"
  ; "fatal_error"
] @function.builtin

; Types
[
  "int"
  "real"
  ; "complex"
  "vector"
  "row_vector"
  "matrix"
  ; "complex_vector"
  ; "complex_row_vector"
  ; "complex_matrix"
  "ordered"
  "positive_ordered"
  "simplex"
  "unit_vector"
  "corr_matrix"
  "cov_matrix"
  "cholesky_factor_cov"
  "cholesky_factor_corr"
  ; "row_stochastic_matrix"
  ; "column_stochastic_matrix"
  "void"
  ; "array"
  ; "tuple"
  "data"
] @type

; Operators
[
  "+" "-" "*" "/" "%" "=" "~" "^" "!"
  "||" "&&" "==" "!=" "<" "<=" ">" ">="
  ".*" "./" 
  ; ".^" 
  "'"
] @operator

; Brackets
[
  "(" ")" "[" "]" "{" "}"
] @punctuation.bracket

; Delimiters
[
  "," ";"
] @punctuation.delimiter

; Properties
[
  "lower"
  "upper"
  ; "offset"
  ; "multiplier"
] @property

; Preprocessor
; (preproc_include directive: "#include" @keyword)
; (preproc_include file: (preproc_file) @string.special)

; Blocks (Modules)
[
  "functions"
  "data"
  "transformed data"
  "parameters"
  "transformed parameters"
  "model"
  "generated quantities"
] @module
