" make sure not get loaded more than once
if exists("b:current_syntax")
    finish
endif

" make sure not get loaded more than once
let b:current_syntax = "potion"

" keywords
syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elseif else
syntax keyword potionKeyword class return

" function
syntax keyword potionFunction print join string

" comment
syntax match potionComment "#.*$"

" operators
syntax match potionOperator "="
syntax match potionOperator "+"
syntax match potionOperator "-"
syntax match potionOperator "\*"
syntax match potionOperator "\/"
syntax match potionOperator "+="
syntax match potionOperator "-="
syntax match potionOperator "\*="
syntax match potionOperator "\/="
syntax match potionOperator "?"

" number
syntax match potionNumber "\([1-9]\d*\|0\)"
syntax match potionNumber "\([1-9]\d*\|0\)\.\d\+"
syntax match potionNumber "\([1-9]\d*\|0\)\(\.\d\+\)\?e[+-][1-9]\d*"
syntax match potionNumber "0x[a-fA-F]\+"

" string
syntax region potionString start=/\"/ end=/\"/ skip=/\\./

" highlight
highlight link potionKeyword Keyword
highlight link potionFunction Function
highlight link potionComment Comment
highlight link potionOperator Operator
highlight link potionNumber Number
highlight link potionString String
