let g:Tex_DefaultTargetFormat = 'pdf'"
" add a <comment> vim: set spelllang=es: to change language
" LaTeX:
let g:tex_flavor='latex'
autocmd FileType tex set spell wrap linebreak
let g:LatexBox_latexmk_async=1
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=2
let g:LaTeXBox_output_type='' "Let latexmkrc choose the type
