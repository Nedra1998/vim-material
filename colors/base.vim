" vi:syntax=vim

" base16-vim (https://github.com/chriskempson/base16-vim)
" by Chris Kempson (http://chriskempson.com)
" Flat scheme by Chris Kempson (http://chriskempson.com)

" This enables the coresponding base16-shell script to run so that
" :colorscheme works in terminals supported by base16-shell scripts
" User must set this variable in .vimrc
"   let g:base16_shell_path=base16-builder/output/shell/
if !has('gui_running')
  if exists("g:base16_shell_path")
    execute "silent !/bin/sh ".g:base16_shell_path."/base16-flat.sh"
  endif
endif

" GUI color definitions
let s:black0 = "2C3E50"
let s:black1 = "34495E"
let s:grey0 = "7F8C8D"
let s:grey1 = "95A5A6"
let s:grey2 = "BDC3C7"
let s:white0 = "e0e0e0"
let s:white1 = "f5f5f5"
let s:white2 = "ECF0F1"
let s:red0 = "E74C3C"
let s:orange0 = "E67E22"
let s:yellow0 = "F1C40F"
let s:green0 = "2ECC71"
let s:cyan0 = "1ABC9C"
let s:blue0 = "3498DB"
let s:magenta0 = "9B59B6"
let s:red1 = "be643c"

" Terminal color definitions
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "10"
  let s:cterm02 = "11"
  let s:cterm04 = "12"
  let s:cterm06 = "13"
  " let s:cterm09 = "09"
  let s:cterm0F = "14"
endif

" Neovim terminal colours
if has("nvim")
  let g:terminal_color_0 =  "#2C3E50"
  let g:terminal_color_1 =  "#E74C3C"
  let g:terminal_color_2 =  "#2ECC71"
  let g:terminal_color_3 =  "#F1C40F"
  let g:terminal_color_4 =  "#3498DB"
  let g:terminal_color_5 =  "#9B59B6"
  let g:terminal_color_6 =  "#1ABC9C"
  let g:terminal_color_7 =  "#e0e0e0"
  let g:terminal_color_8 =  "#95A5A6"
  let g:terminal_color_9 =  "#E67E22"
  let g:terminal_color_10 = "#34495E"
  let g:terminal_color_11 = "#7F8C8D"
  let g:terminal_color_12 = "#BDC3C7"
  let g:terminal_color_13 = "#f5f5f5"
  let g:terminal_color_14 = "#be643c"
  let g:terminal_color_15 = "#ECF0F1"
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_7
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
endif

" Theme setup
hi clear
syntax reset
let g:colors_name = "base16-flat"

" Highlighting function
fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=#" . a:guisp
  endif
endfun


" C highlighting
call <sid>hi("cOperator",   s:cyan0, "", s:cterm0C, "", "", "")
call <sid>hi("cPreCondit",  s:magenta0, "", s:cterm0E, "", "", "")

" C# highlighting
call <sid>hi("csClass",                 s:yellow0, "", s:cterm0A, "", "", "")
call <sid>hi("csAttribute",             s:yellow0, "", s:cterm0A, "", "", "")
call <sid>hi("csModifier",              s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("csType",                  s:red0, "", s:cterm08, "", "", "")
call <sid>hi("csUnspecifiedStatement",  s:blue0, "", s:cterm0D, "", "", "")
call <sid>hi("csContextualStatement",   s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("csNewDecleration",        s:red0, "", s:cterm08, "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:white0, "", s:cterm05, "", "", "")
call <sid>hi("cssClassName",   s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("cssColor",       s:cyan0, "", s:cterm0C, "", "", "")

" Git highlighting
call <sid>hi("gitcommitOverflow",       s:red0, "", s:cterm08, "", "", "")
call <sid>hi("gitcommitSummary",        s:green0, "", s:cterm0B, "", "", "")
call <sid>hi("gitcommitComment",        s:grey1, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitUntracked",      s:grey1, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitDiscarded",      s:grey1, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitSelected",       s:grey1, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitHeader",         s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("gitcommitSelectedType",   s:blue0, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitUnmergedType",   s:blue0, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitDiscardedType",  s:blue0, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitBranch",         s:orange0, "", s:cterm09, "", "bold", "")
call <sid>hi("gitcommitUntrackedFile",  s:yellow0, "", s:cterm0A, "", "", "")
call <sid>hi("gitcommitUnmergedFile",   s:red0, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitDiscardedFile",  s:red0, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitSelectedFile",   s:green0, "", s:cterm0B, "", "bold", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:green0, s:black1, s:cterm0B, s:cterm01, "", "")
call <sid>hi("GitGutterChange",  s:blue0, s:black1, s:cterm0D, s:cterm01, "", "")
call <sid>hi("GitGutterDelete",  s:red0, s:black1, s:cterm08, s:cterm01, "", "")
call <sid>hi("GitGutterChangeDelete",  s:magenta0, s:black1, s:cterm0E, s:cterm01, "", "")

" HTML highlighting
call <sid>hi("htmlBold",    s:yellow0, "", s:cterm0A, "", "", "")
call <sid>hi("htmlItalic",  s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("htmlEndTag",  s:white0, "", s:cterm05, "", "", "")
call <sid>hi("htmlTag",     s:white0, "", s:cterm05, "", "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:white0, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptBraces",  s:white0, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptNumber",  s:orange0, "", s:cterm09, "", "", "")
" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator",          s:blue0, "", s:cterm0D, "", "", "")
call <sid>hi("jsStatement",         s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("jsReturn",            s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("jsThis",              s:red0, "", s:cterm08, "", "", "")
call <sid>hi("jsClassDefinition",   s:yellow0, "", s:cterm0A, "", "", "")
call <sid>hi("jsFunction",          s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("jsFuncName",          s:blue0, "", s:cterm0D, "", "", "")
call <sid>hi("jsFuncCall",          s:blue0, "", s:cterm0D, "", "", "")
call <sid>hi("jsClassFuncName",     s:blue0, "", s:cterm0D, "", "", "")
call <sid>hi("jsClassMethodType",   s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("jsRegexpString",      s:cyan0, "", s:cterm0C, "", "", "")
call <sid>hi("jsGlobalObjects",     s:yellow0, "", s:cterm0A, "", "", "")
call <sid>hi("jsGlobalNodeObjects", s:yellow0, "", s:cterm0A, "", "", "")
call <sid>hi("jsExceptions",        s:yellow0, "", s:cterm0A, "", "", "")
call <sid>hi("jsBuiltins",          s:yellow0, "", s:cterm0A, "", "", "")

" Mail highlighting
call <sid>hi("mailQuoted1",  s:yellow0, "", s:cterm0A, "", "", "")
call <sid>hi("mailQuoted2",  s:green0, "", s:cterm0B, "", "", "")
call <sid>hi("mailQuoted3",  s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("mailQuoted4",  s:cyan0, "", s:cterm0C, "", "", "")
call <sid>hi("mailQuoted5",  s:blue0, "", s:cterm0D, "", "", "")
call <sid>hi("mailQuoted6",  s:yellow0, "", s:cterm0A, "", "", "")
call <sid>hi("mailURL",      s:blue0, "", s:cterm0D, "", "", "")
call <sid>hi("mailEmail",    s:blue0, "", s:cterm0D, "", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:green0, "", s:cterm0B, "", "", "")
call <sid>hi("markdownError",             s:white0, s:black0, s:cterm05, s:cterm00, "", "")
call <sid>hi("markdownCodeBlock",         s:green0, "", s:cterm0B, "", "", "")
call <sid>hi("markdownHeadingDelimiter",  s:blue0, "", s:cterm0D, "", "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:blue0, "", s:cterm0D, "", "", "")
call <sid>hi("NERDTreeExecFile",  s:white0, "", s:cterm05, "", "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:white0, "", s:cterm05, "", "", "")
call <sid>hi("phpComparison",      s:white0, "", s:cterm05, "", "", "")
call <sid>hi("phpParent",          s:white0, "", s:cterm05, "", "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:magenta0, "", s:cterm0E, "", "", "")/
call <sid>hi("pythonRepeat",    s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("pythonInclude",   s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("pythonStatement", s:magenta0, "", s:cterm0E, "", "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:blue0, "", s:cterm0D, "", "", "")
call <sid>hi("rubyConstant",                s:yellow0, "", s:cterm0A, "", "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:red1, "", s:cterm0F, "", "", "")
call <sid>hi("rubyRegexp",                  s:cyan0, "", s:cterm0C, "", "", "")
call <sid>hi("rubySymbol",                  s:green0, "", s:cterm0B, "", "", "")
call <sid>hi("rubyStringDelimiter",         s:green0, "", s:cterm0B, "", "", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:red0, "", s:cterm08, "", "", "")
call <sid>hi("sassClassChar",  s:orange0, "", s:cterm09, "", "", "")
call <sid>hi("sassInclude",    s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("sassMixing",     s:magenta0, "", s:cterm0E, "", "", "")
call <sid>hi("sassMixinName",  s:blue0, "", s:cterm0D, "", "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:green0, s:black1, s:cterm0B, s:cterm01, "", "")
call <sid>hi("SignifySignChange",  s:blue0, s:black1, s:cterm0D, s:cterm01, "", "")
call <sid>hi("SignifySignDelete",  s:red0, s:black1, s:cterm08, s:cterm01, "", "")

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:black0 s:black1 s:grey0 s:grey1  s:grey2  s:white0  s:white1  s:white2  s:red0  s:orange0 s:yellow0  s:green0  s:cyan0  s:blue0  s:magenta0  s:red1
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
