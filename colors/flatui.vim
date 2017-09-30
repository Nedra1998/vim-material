" -----------------------------------------------------------------------------
" File: flatui.vim
" Theme: flatui
" Description: Vim color scheme based on Flat-UI color plllet
" Author: Arden Rasmussen
" Version: 0.0
" Source: https://github.com/Nedra1998/vim-flatui
" -----------------------------------------------------------------------------

" Supporting Code -------------------------------------------------------------

" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name="flatui"

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

function! s:sgo(opt, val)
  if !exists("g:" . a:opt)
    let g:{a:opt} = a:val
  endif
endfunction

call s:sgo("flatui_bold", 1)
call s:sgo("flatui_italic", 1)
call s:sgo("flatui_undercurl", 1)
call s:sgo("flatui_underline", 1)
call s:sgo("flatui_inverse", 1)
call s:sgo("flatui_termcolors", 256)

" }}}
" Palette: {{{

let s:ui = {}

let s:ui.black0 =  ['#2C3E50', 00]
let s:ui.black1 =  ['#34495E', 00]
let s:ui.grey0 =   ['#7F8C8D', 07]
let s:ui.grey1 =   ['#95A5A6', 08]
let s:ui.white0  = ['#E8E8E8', 15]
let s:ui.white1  = ['#ECF0F1', 15]

let s:ui.light_red    = ['#E74C3C', 01]
let s:ui.light_green  = ['#2ECC71', 02]
let s:ui.light_yellow = ['#F1C40F', 03]
let s:ui.light_blue   = ['#3498DB', 04]
let s:ui.light_magenta = ['#9B59B6', 05]
let s:ui.light_cyan   = ['#1ABC9C', 06]

let s:ui.dark_red    = ['#C0392B', 09]
let s:ui.dark_green  = ['#27AE60', 10]
let s:ui.dark_yellow = ['#F39C12', 11]
let s:ui.dark_blue   = ['#2980B9', 12]
let s:ui.dark_magenta = ['#8E44AD', 13]
let s:ui.dark_cyan   = ['#16A085', 14]

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:flatui_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:flatui_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:flatui_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:flatui_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:flatui_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg',   'bg'  ]
let s:vim_fg = ['fg',   'fg'  ]
let s:none   = ['NONE', 'NONE']

if &background=="light"
  let s:bg0     = s:ui.white1
  let s:bg1     = s:ui.white0
  let s:bg2     = s:ui.grey1
  let s:fg0     = s:ui.grey0
  let s:fg1     = s:ui.black0
  let s:fg2     = s:ui.black1

  let s:red0    = s:ui.dark_red
  let s:green0  = s:ui.dark_green
  let s:yellow0 = s:ui.dark_yellow
  let s:blue0   = s:ui.dark_blue
  let s:magenta0 = s:ui.dark_magenta
  let s:cyan0   = s:ui.dark_cyan

  let s:red1    = s:ui.light_red
  let s:green1  = s:ui.light_green
  let s:yellow1 = s:ui.light_yellow
  let s:blue1   = s:ui.light_blue
  let s:magenta1 = s:ui.light_magenta
  let s:cyan1   = s:ui.light_cyan
else
  let s:bg0     = s:ui.black0
  let s:bg1     = s:ui.black1
  let s:bg2     = s:ui.grey0
  let s:fg0     = s:ui.grey1
  let s:fg1     = s:ui.white0
  let s:fg2     = s:ui.white1

  let s:red0    = s:ui.light_red
  let s:green0  = s:ui.light_green
  let s:yellow0 = s:ui.light_yellow
  let s:blue0   = s:ui.light_blue
  let s:magenta0 = s:ui.light_magenta
  let s:cyan0   = s:ui.light_cyan

  let s:red1    = s:ui.dark_red
  let s:green1  = s:ui.dark_green
  let s:yellow1 = s:ui.dark_yellow
  let s:blue1   = s:ui.dark_blue
  let s:magenta1 = s:ui.dark_magenta
  let s:cyan1   = s:ui.dark_cyan
endif

if g:flatui_termcolors == 16
  let s:bg1[1]    = 0
  let s:red0[1]    = 1
  let s:green0[1]  = 2
  let s:yellow0[1] = 3
  let s:blue0[1]   = 4
  let s:magenta0[1] = 5
  let s:cyan0[1]   = 6
  let s:fg2[1]    = 7
  let s:bg2[1]    = 8
  let s:red1[1]    = 9
  let s:green1[1]  = 10
  let s:yellow1[1] = 11
  let s:blue1[1]   = 12
  let s:magenta1[1] = 13
  let s:cyan1[1]   = 14
  let s:fg0[1]    = 15
endif

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_background = s:bg0[0]
  let g:terminal_color_foreground = s:fg1[0]

  let g:terminal_color_0  = s:bg1[0]
  let g:terminal_color_8  = s:bg2[0]

  let g:terminal_color_15 = s:fg0[0]
  let g:terminal_color_7  = s:fg2[0]

  let g:terminal_color_1  = s:red0[0]
  let g:terminal_color_2  = s:green0[0]
  let g:terminal_color_3  = s:yellow0[0]
  let g:terminal_color_4  = s:blue0[0]
  let g:terminal_color_5  = s:magenta0[0]
  let g:terminal_color_6  = s:cyan0[0]
  let g:terminal_color_9  = s:red1[0]
  let g:terminal_color_10 = s:green1[0]
  let g:terminal_color_11 = s:yellow1[0]
  let g:terminal_color_12 = s:blue1[0]
  let g:terminal_color_13 = s:magenta1[0]
  let g:terminal_color_14 = s:cyan1[0]
endif

" }}}
" Overload Setting: {{{

" let s:hls_cursor = s:yellow1
" let s:number_column = s:none
" let s:sign_column = s:bg1
" let s:color_column = s:bg1
" let s:vert_split = s:bg1
" let s:invert_selection = s:inverse
" let s:italicize_comments = s:italic
" let s:italicize_strings  = s:italic

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  "emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    let fg = a:3
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' .emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}

" Vanilla Colorscheme ---------------------------------------------------------
" General UI: {{{

call s:HL('Normal', s:fg1, s:bg0)

if version >= 700
  call s:HL('CursorLine', s:none, s:bg1)
  call s:HL('CursorColumn', s:none, s:bg1)
  call s:HL('TabLine', s:fg0, s:bg1)
  call s:HL('TabLineFill', s:fg0, s:bg1)
  call s:HL('TabLineSel', s:green0, s:bg1)
  call s:HL('MatchParen', s:none, s:bg1, s:bold)
endif

if version >= 703
  call s:HL('ColorColumn', s:none, s:bg1)
  call s:HL('Conceal', s:blue0, s:bg0)
  call s:HL('CursorLineNr', s:yellow0, s:bg1, s:bold)
endif

call s:HL('NonText', s:fg0, s:none, s:bold)
call s:HL('SpecialKey', s:fg0, s:none, s:bold)

call s:HL('Visual', s:bg0, s:bg2)
call s:HL('VisualNOS', s:none, s:bg2)

call s:HL('Search', s:bg0, s:yellow0)
call s:HL('IncSearch', s:bg0, s:yellow1)

call s:HL('Underlined', s:magenta1, s:none, s:underline)
call s:HL('Bold', s:none, s:none, s:bold)
call s:HL('Italic', s:none, s:none, s:italic)

call s:HL('StatusLine', s:red0, s:none)
call s:HL('StatusLineNC', s:none, s:none)

call s:HL('VertSplit', s:bg2, s:bg2)

call s:HL('QuickFixLine', s:none, s:bg1)

call s:HL('WildMenu', s:red1, s:yellow0)

call s:HL('Directory', s:blue0, s:none)

call s:HL('Title', s:blue0, s:none, s:bold)

call s:HL('ErrorMsg', s:none, s:red0)
call s:HL('MoreMsg', s:blue0, s:none, s:bold)
call s:HL('ModeMsg', s:blue0, s:none, s:bold)
call s:HL('Question', s:cyan0, s:none, s:bold)
call s:HL('WarningMsg', s:red0, s:none)
call s:HL('TooLong', s:red0)
call s:HL('Debug', s:red0)

" }}}
" Gutter: {{{

call s:HL('LineNr', s:fg0, s:bg1)

call s:HL('SignColumn', s:fg0, s:bg1)

call s:HL('Folded', s:green1, s:bg1, s:italic)
call s:HL('FoldColumn', s:cyan1, s:bg1, s:italic)

" }}}
" Cursor: {{{

call s:HL('Cursor', s:none, s:none, s:inverse)
call s:HL('vCursor', s:none, s:none, s:inverse)
call s:HL('iCursor', s:none, s:none, s:inverse)
call s:HL('lCursor', s:none, s:none, s:inverse)

" }}}
" Syntax Highlighting: {{{

call s:HL('Special', s:red0)

call s:HL('Comment', s:fg0, s:none, s:italic)
call s:HL('Todo', s:yellow0, s:bg1)
call s:HL('Error', s:red0, s:bg1, s:bold)

" Generic Statement
" Bold?
call s:HL('Statement', s:green0, s:none, s:bold)
call s:HL('Conditional', s:magenta0)
call s:HL('Repeat', s:yellow0)
call s:HL('Label', s:yellow0)
call s:HL('Exception', s:red0)
call s:HL('Operator', s:green0)
call s:HL('Keyword', s:magenta0)
call s:HL('Delimiter', s:red1)

" Variable Name
call s:HL('Identifier', s:blue0)
call s:HL('Function', s:blue0)

"Generic PreProcessor
call s:HL('PreProc', s:yellow1)
call s:HL('Include', s:blue0)
call s:HL('Define', s:magenta0)
call s:HL('Macro', s:red0)
call s:HL('PreCondit', s:magenta0)

"Generic Constant
call s:HL('Constant', s:cyan1)
call s:HL('Character', s:red0)
call s:HL('SpecialChar', s:red1)
call s:HL('String', s:green0)
call s:HL('Boolean', s:yellow1)
call s:HL('Number', s:yellow1)
call s:HL('Float', s:yellow1)
call s:HL('Type', s:yellow0)
call s:HL('Tag', s:yellow0)
call s:HL('StorageClass', s:yellow0)
call s:HL('Structure', s:magenta0)
call s:HL('Typedef', s:yellow0)

" }}}
" Completion Menu: {{{

if version >= 700
  call s:HL('Pmenu', s:fg2, s:bg1)
  call s:HL('PmenuSel', s:bg1, s:blue0, s:bold)
  call s:HL('PmenuSbar', s:none, s:bg1)
  call s:HL('PmenuThumb', s:none, s:fg0)
endif

" }}}
" Diffs: {{{

call s:HL('DiffAdd', s:green0, s:bg1)
call s:HL('DiffChange', s:yellow0, s:bg1)
call s:HL('DiffDelete', s:red0, s:bg1)
call s:HL('DiffText', s:blue0, s:bg1)
call s:HL('DiffAdded', s:green0, s:bg0)
call s:HL('DiffFile', s:red0, s:bg0)
call s:HL('DiffNewFile', s:green0, s:bg0)
call s:HL('DiffLine', s:blue0, s:bg0)
call s:HL('DiffRemoved', s:red0, s:bg0)

" }}}
" Spelling: {{{

if has("spell")
  call s:HL('SpellCap', s:none, s:none, s:italic . s:undercurl, s:yellow0)
  call s:HL('SpellBad', s:none, s:none, s:italic . s:undercurl , s:red0)
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:cyan0)
  call s:HL('SpellRare', s:none, s:none, s:undercurl, s:magenta0)
endif

" }}}

" Filetype Specific -----------------------------------------------------------
" Bash: {{{

call s:HL('bashStatement', s:none, s:none, s:bold)

" }}}
" C: {{{

call s:HL('cOperator', s:cyan0)
call s:HL('cPreCondit', s:magenta0)

" }}}
" CMake: {{{

call s:HL('cmakeStatement', s:red0)
call s:HL('cmakeArguments', s:fg1)
call s:HL('cmakeVariableValue', s:blue0)
call s:HL('cmakeOperator', s:red0)

" }}}
" CPP: {{{

call s:HL('cppSTLnamespace', s:magenta0)

" }}}
" CS: {{{

call s:HL('csClass', s:yellow0)
call s:HL('csAttribute', s:yellow0)
call s:HL('csModifier', s:magenta0)
call s:HL('csType', s:red0)
call s:HL('csUnspecifiedStatement', s:blue0)
call s:HL('csContextualStatement', s:magenta0)
call s:HL('csNewDecleration', s:red0)

" }}}
" Fish: {{{

call s:HL('fishStatement', s:blue0, s:none, s:bold)
call s:HL('fishString', s:green0)
call s:HL('fishConditional', s:magenta0)
call s:HL('fishRepeat', s:magenta0, s:none, s:bold)

" }}}
" HTML: {{{

call s:HL('htmlTitle', s:green0, s:none, s:bold)
call s:HL('htmlH1', s:green0, s:none, s:bold)
call s:HL('htmlH2', s:blue0, s:none, s:bold)
call s:HL('htmlH3', s:magenta0, s:none, s:bold)
call s:HL('htmlH4', s:yellow1, s:none, s:bold)
call s:HL('htmlH5', s:green1, s:none, s:bold)
call s:HL('htmlH6', s:blue1, s:none, s:bold)
call s:HL('htmlH7', s:magenta1, s:none, s:bold)
call s:HL('htmlTag', s:fg1)
call s:HL('htmlTagName', s:blue0, s:none, s:bold)
call s:HL('htmlArg', s:fg1)
call s:HL('htmlEndTag', s:fg1)
call s:HL('htmlBold', s:none, s:none, s:bold)
call s:HL('htmlItalic', s:none, s:none, s:italic)

" }}}
" Mail: {{{

call s:HL('mailHeaderKey', s:blue0)
call s:HL('mailHeaderEmail', s:magenta0)
call s:HL('mailSubject', s:red0)
call s:HL('mailHeader', s:fg0)
call s:HL('mailURL', s:cyan0)
call s:HL('mailEmail', s:magenta0)
call s:HL('mailQuoted1', s:green0)
call s:HL('mailQuoted2', s:blue0)

" }}}
" Makefile: {{{

call s:HL('makeDefine', s:yellow0)
call s:HL('makeIdent', s:fg1)
call s:HL('makeSpecTarget', s:green0)
call s:HL('makeTarget', s:red0)
call s:HL('makeStatememt', s:magenta0, s:none, s:bold)
call s:HL('makeCommands', s:blue0)
call s:HL('makeSpecial', s:yellow0, s:none, s:bold)

" }}}
" Markdown: {{{

call s:HL('mkdHeadingRule', s:green0, s:none, s:bold)
call s:HL('mkdH1', s:green0, s:none, s:bold)
call s:HL('mkdH2', s:blue0, s:none, s:bold)

call s:HL('mkdBlockquote', s:none, s:bg1)
call s:HL('mkdCode', s:green0)
call s:HL('mkdCodeStart', s:red0)
call s:HL('mkdCodeEnd', s:red0)
call s:HL('mkdLink', s:blue0, s:none, s:underline)
call s:HL('mkdUrl', s:magenta1)
call s:HL('mkdDelimiter', s:yellow0)
call s:HL('mkdDelimiter', s:yellow0)
call s:HL('mkdRule', s:magenta0)

" }}}
" Python: {{{

call s:HL('pythonOperator', s:magenta0)
call s:HL('pythonRepeat', s:magenta0)
call s:HL('pythonInclude', s:magenta0)
call s:HL('pythonStatement', s:magenta0)

" }}}
" ReStructuredText: {{{

call s:HL('rstSections', s:blue0, s:none, s:bold)
call s:HL('rstDirective', s:blue0)
call s:HL('rstHyperlinkTarget', s:green0)
call s:HL('rstInlineLiteral', s:green1)
call s:HL('rstInterpretedTextOrHyperLinkReference', s:blue0)

" }}}
" Shell: {{{

call s:HL('shDerefVar', s:cyan0, s:none, s:bold)
call s:HL('shDerefSimple', s:cyan0)
call s:HL('shFunction', s:yellow1, s:none, s:bold)
call s:HL('shStatement', s:none)
call s:HL('shLoop', s:magenta0, s:none, s:bold)
call s:HL('shQuote', s:green1)
call s:HL('shCaseEsac', s:cyan0, s:none, s:bold)
call s:HL('shSnglCase', s:magenta0)
call s:HL('shFunctionOne', s:blue0)
call s:HL('shCase', s:blue0)
call s:HL('shSetList', s:red1)
call s:HL('shOperator', s:cyan0)
call s:HL('shOption', s:green1)
call s:HL('shLine', s:none)
call s:HL('shWrapLineOperator', s:red1)

" }}}
" Tex: {{{

call s:HL('texStatement', s:green0)
call s:HL('texMathZoneX', s:blue0)
call s:HL('texMathZoneX', s:blue0)
call s:HL('texMathMatcher', s:blue0)
call s:HL('texRefLabel', s:green0)
call s:HL('texBoldStyle', s:none, s:none, s:bold)
call s:HL('texItalStyle', s:none, s:none, s:italic)

" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:magenta1, s:none, s:bold . s:italic)
call s:HL('vimCommentString', s:magenta1)
call s:HL('vimCommand', s:yellow0)
call s:HL('vimCmdSep', s:blue0, s:none, s:bold)
call s:HL('vimIsCommand', s:fg1)
call s:HL('vimSynMtchOpt', s:yellow0)
call s:HL('vimSynType', s:cyan0)
call s:HL('vimHiLink', s:blue0)
call s:HL('vimHiGroup', s:blue0)
call s:HL('vimGroup', s:blue0, s:none, s:bold)

" }}}
" Vim Help: {{{

call s:HL('helpExample', s:fg1)
call s:HL('helpOption', s:cyan0)
call s:HL('helpNote', s:magenta0)
call s:HL('helpVim', s:magenta0)
call s:HL('helpHyperTextJump', s:blue0)
call s:HL('helpHyperTextEntry', s:green0)

" }}}
" Yaml: {{{

call s:HL('yamlBlockMappingKey', s:blue0)
call s:HL('yamlKeyValueDelimiter', s:yellow0)
call s:HL('yamlBlockCollectionItemStart', s:yellow0)

" }}}

" Plugin Specific -------------------------------------------------------------
" NERDTree: {{{

call s:HL('NERDTreeExecFile', s:green0, s:none, s:bold)

" }}}
