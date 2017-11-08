" -----------------------------------------------------------------------------
" File: material.vim
" Theme: material
" Description: Vim color scheme based on google material design pallet
" Author: Arden Rasmussen
" Version: 0.0
" Source: https://github.com/Nedra1998/vim-material
" -----------------------------------------------------------------------------

" Supporting Code -------------------------------------------------------------

" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name="material"

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

function! s:set_color(opt, val)
  if a:val == "red"
    let s:{a:opt} = s:ui.red
  elseif a:val == "pink"
    let s:{a:opt} = s:ui.pink
  elseif a:val == "orange"
    let s:{a:opt} = s:ui.orange
  elseif a:val == "yellow"
    let s:{a:opt} = s:ui.yellow
  elseif a:val == "green"
    let s:{a:opt} = s:ui.green
  elseif a:val == "pale_blue"
    let s:{a:opt} = s:ui.pale_blue
  elseif a:val == "cyan"
    let s:{a:opt} = s:ui.cyan
  elseif a:val == "blue"
    let s:{a:opt} = s:ui.blue
  elseif a:val == "purple"
    let s:{a:opt} = s:ui.purple
  elseif a:val == "violet"
    let s:{a:opt} = s:ui.violet
  elseif a:val == "brown"
    let s:{a:opt} = s:ui.brown
  elseif a:val == "grey"
    let s:{a:opt} = s:ui.dark_gray
  elseif a:val == "white"
    let s:{a:opt} = s:ui.white
  endif
endfunction

call s:sgo("material_bold", 1)
call s:sgo("material_italic", 1)
call s:sgo("material_undercurl", 1)
call s:sgo("material_underline", 1)
call s:sgo("material_inverse", 1)
call s:sgo("material_termcolors", 256)
call s:sgo("material_primary", "blue")
call s:sgo("material_secondary", "")

" }}}
" Palette: {{{

let s:ui = {}

let s:ui.white             = ['#FFFFFF', 255]
let s:ui.very_lighter_gray = ['#EEFFFF', 231]
let s:ui.very_light_gray   = ['#CDDEE5', 188]
let s:ui.lighter_gray      = ['#B2CCD6', 152]
let s:ui.light_gray        = ['#485F6A', 066]
let s:ui.dark_gray         = ['#373B41', 059]
let s:ui.darker_gray       = ['#282A2E', 059]
let s:ui.very_dark_gray    = ['#33444d', 060]
let s:ui.very_darker_gray  = ['#263238', 059]

let s:ui.red             = ['#FF5370', 210]
let s:ui.dark_red        = ['#E53935', 167]
let s:ui.pink            = ['#F07178', 210]
let s:ui.dark_pink       = ['#FF5370', 210]
let s:ui.orange          = ['#F78C6C', 216]
let s:ui.dark_orange     = ['#F76D47', 209]
let s:ui.yellow          = ['#FFCB6B', 222]
let s:ui.dark_yellow     = ['#FFB62C', 221]
let s:ui.green           = ['#C3E88D', 193]
let s:ui.dark_green      = ['#91B859', 150]
let s:ui.pale_blue       = ['#B2CCD6', 152]
let s:ui.dark_pale_blue  = ['#8796B0', 145]
let s:ui.cyan            = ['#89DDFF', 153]
let s:ui.dark_cyan       = ['#39ADB5', 074]
let s:ui.blue            = ['#28AAFF', 075]
let s:ui.dark_blue       = ['#6182B8', 110]
let s:ui.purple          = ['#C792EA', 183]
let s:ui.dark_purple     = ['#7C4DFF', 105]
let s:ui.violet          = ['#C792EA', 183]
let s:ui.dark_violet     = ['#945EB8', 140]
let s:ui.brown           = ['#AB7967', 138]
let s:ui.dark_brown      = ['#AB7967', 138]
" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:material_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:material_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:material_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:material_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:material_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg',   'bg'  ]
let s:vim_fg = ['fg',   'fg'  ]
let s:none   = ['NONE', 'NONE']

if &background=="light"
  let s:background   = s:ui.very_lighter_gray
  let s:background_1 = s:ui.very_light_gray
  let s:background_2 = s:ui.lighter_gray
  let s:background_3 = s:ui.light_gray
  let s:foreground   = s:ui.very_darker_gray
  let s:foreground_1 = s:ui.very_dark_gray
  let s:foreground_2 = s:ui.darker_gray
  let s:foreground_3 = s:ui.dark_gray
else
  let s:background = s:ui.very_darker_gray
  let s:background_1 = s:ui.very_dark_gray
  let s:background_2 = s:ui.darker_gray
  let s:background_3 = s:ui.dark_gray
  let s:foreground = s:ui.very_lighter_gray
  let s:foreground_1 = s:ui.very_light_gray
  let s:foreground_2 = s:ui.lighter_gray
  let s:foreground_3 = s:ui.light_gray
endif

call s:set_color("primary", g:material_primary)
call s:set_color("secondary", g:material_secondary)

if !exists("s:secondary")
  if g:material_primary == "red"
    let s:secondary = s:ui.cyan
  elseif g:material_primary == "pink"
    let s:secondary = s:ui.cyan
  elseif g:material_primary == "orange"
    let s:secondary = s:ui.dark_orange
  elseif g:material_primary == "yellow"
    let s:secondary = s:ui.dark_yellow
  elseif g:material_primary == "green"
    let s:secondary = s:ui.dark_green
  elseif g:material_primary == "pale_blue"
    let s:secondary = s:ui.white
  elseif g:material_primary == "cyan"
    let s:secondary = s:ui.dark_cyan
  elseif g:material_primary == "blue"
    let s:secondary = s:ui.white
  elseif g:material_primary == "purple"
    let s:secondary = s:ui.green
  elseif g:material_primary == "violet"
    let s:secondary = s:ui.white
  elseif g:material_primary == "brown"
    let s:secondary = s:ui.white
  elseif g:material_primary == "grey"
    let s:secondary = s:ui.white
  elseif g:material_primary == "white"
    let s:secondary = s:ui.blue
  endif
endif

if g:material_termcolors == 16
  let s:ui.very_lighter_gray[1] = 15
  let s:ui.very_light_gray[1] = 15
  let s:ui.light_gray[1]      = 07
  let s:ui.gray[1]            = 14
  let s:ui.dark_gray[1]       = 08
  let s:ui.very_dark_gray[1]  = 00
  let s:ui.very_darker_gray[1]  = 00

  let s:ui.red[1]             = 01
  let s:ui.dark_red[1]        = 09
  let s:ui.pink[1]            = 01
  let s:ui.dark_pink[1]       = 09
  let s:ui.orange[1]          = 03
  let s:ui.dark_orange[1]     = 11
  let s:ui.yellow[1]          = 03
  let s:ui.dark_yellow[1]     = 11
  let s:ui.green[1]           = 02
  let s:ui.dark_green[1]      = 10
  let s:ui.pale_blue[1]       = 04
  let s:ui.dark_pale_blue[1]  = 12
  let s:ui.cyan[1]            = 06
  let s:ui.dark_cyan[1]       = 14
  let s:ui.blue[1]            = 06
  let s:ui.dark_blue[1]       = 14
  let s:ui.purple[1]          = 05
  let s:ui.dark_purple[1]     = 13
  let s:ui.violet[1]          = 05
  let s:ui.dark_violet[1]     = 13
  let s:ui.brown[1]           = 07
  let s:ui.dark_brown[1]      = 08
endif

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_background = s:background[0]
  let g:terminal_color_foreground = s:foreground[0]

  let g:terminal_color_0  = s:ui.darker_gray[0]
  let g:terminal_color_1  = s:ui.red[0]
  let g:terminal_color_2  = s:ui.green[0]
  let g:terminal_color_3  = s:ui.yellow[0]
  let g:terminal_color_4  = s:ui.blue[0]
  let g:terminal_color_5  = s:ui.purple[0]
  let g:terminal_color_6  = s:ui.cyan[0]
  let g:terminal_color_7  = s:ui.light_gray[0]
  let g:terminal_color_8  = s:ui.dark_gray[0]
  let g:terminal_color_9  = s:ui.dark_red[0]
  let g:terminal_color_10 = s:ui.dark_green[0]
  let g:terminal_color_11 = s:ui.dark_yellow[0]
  let g:terminal_color_12 = s:ui.dark_blue[0]
  let g:terminal_color_13 = s:ui.dark_purple[0]
  let g:terminal_color_14 = s:ui.dark_cyan[0]
  let g:terminal_color_15 = s:ui.lighter_gray[0]
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

call s:HL('Normal', s:foreground, s:background)

if version >= 700
  call s:HL('CursorLine', s:none, s:background_2)
  call s:HL('CursorColumn', s:none, s:background_2)
  call s:HL('TabLine', s:ui.lighter_gray, s:ui.darker_gray)
  call s:HL('TabLineFill', s:ui.lighter_gray, s:ui.darker_gray)
  call s:HL('TabLineSel', s:ui.green, s:ui.darker_gray)
  call s:HL('MatchParen', s:primary, s:background_2, s:bold . s:underline)
endif

if version >= 703
  call s:HL('ColorColumn', s:none, s:background_2)
  call s:HL('Conceal', s:ui.blue, s:background)
  call s:HL('CursorLineNr', s:primary, s:background_2, s:bold)
endif

call s:HL('NonText', s:none, s:none, s:bold)
call s:HL('SpecialKey', s:none, s:none, s:bold)

call s:HL('Visual', s:secondary, s:background_3)
call s:HL('VisualNOS', s:secondary, s:background_3)

call s:HL('Search', s:ui.darker_gray, s:ui.yellow)
call s:HL('IncSearch', s:ui.yellow, s:none)

call s:HL('Underlined', s:ui.blue, s:none, s:underline)
call s:HL('Bold', s:none, s:none, s:bold)
call s:HL('Italic', s:none, s:none, s:italic)

call s:HL('StatusLine', s:primary, s:none)
call s:HL('StatusLineNC', s:secondary, s:none)

call s:HL('VertSplit', s:background_2, s:background_2)

call s:HL('QuickFixLine', s:none, s:background_2)

call s:HL('WildMenu', s:background_1, s:ui.cyan)

call s:HL('Directory', s:ui.blue, s:none)

call s:HL('Title', s:ui.green, s:none, s:bold)

call s:HL('ErrorMsg', s:none, s:ui.red)
call s:HL('MoreMsg', s:ui.green, s:none, s:bold)
call s:HL('ModeMsg', s:ui.green, s:none, s:bold)
call s:HL('Question', s:ui.blue, s:none, s:bold)
call s:HL('WarningMsg', s:ui.orange, s:none)
call s:HL('TooLong', s:ui.red)
call s:HL('Debug', s:ui.red)

" }}}
" Gutter: {{{

call s:HL('LineNr', s:foreground_3, s:background_2)
call s:HL('EndOfBuffer', s:background, s:background)

call s:HL('SignColumn', s:foreground_2, s:background_2)

call s:HL('Folded', s:primary, s:ui.dark_gray, s:italic)
call s:HL('FoldColumn', s:primary, s:ui.dark_gray, s:italic)

" }}}
" Cursor: {{{

call s:HL('Cursor', s:primary, s:none, s:inverse)
call s:HL('vCursor', s:primary, s:none, s:inverse)
call s:HL('iCursor', s:primary, s:none, s:inverse)
call s:HL('lCursor', s:primary, s:none, s:inverse)

" }}}
" Syntax Highlighting: {{{

call s:HL('Special', s:primary)

call s:HL('Comment', s:ui.light_gray, s:none, s:italic)
call s:HL('Todo', s:ui.orange, s:background_2)
call s:HL('Error', s:ui.red, s:background_2, s:bold)

" Generic Statement:
call s:HL('Statement', s:ui.purple, s:none)
call s:HL('Conditional', s:ui.purple)
call s:HL('Repeat', s:ui.orange)
call s:HL('Label', s:ui.orange)
call s:HL('Exception', s:ui.red)
call s:HL('Operator', s:ui.cyan)
call s:HL('Keyword', s:ui.purple)
call s:HL('Delimiter', s:ui.cyan)

" " Variable Name
call s:HL('Identifier', s:ui.red)
call s:HL('Function', s:ui.blue)

" Generic PreProcessor
call s:HL('PreProc', s:ui.cyan)
call s:HL('Include', s:ui.blue)
call s:HL('Define', s:ui.purple)
call s:HL('Macro', s:ui.purple)
call s:HL('PreCondit', s:ui.purple)

" Generic Constant
call s:HL('Constant', s:ui.orange)
call s:HL('Character', s:ui.red)
call s:HL('SpecialChar', s:ui.dark_red)
call s:HL('String', s:ui.dark_green)
call s:HL('Boolean', s:ui.red)
call s:HL('Number', s:ui.orange)
call s:HL('Float', s:ui.yellow)
call s:HL('Type', s:ui.yellow)
call s:HL('Tag', s:ui.yellow)
call s:HL('StorageClass', s:ui.purple)
call s:HL('Structure', s:ui.yellow)
call s:HL('Typedef', s:ui.yellow)

" }}}
" Completion Menu: {{{

if version >= 700
  call s:HL('Pmenu', s:foreground_2, s:background_2)
  call s:HL('PmenuSel', s:background_2, s:primary, s:bold)
  call s:HL('PmenuSbar', s:none, s:background)
  call s:HL('PmenuThumb', s:none, s:foreground_2)
endif

" }}}
" Diffs: {{{

call s:HL('DiffAdd', s:ui.green, s:background_2)
call s:HL('DiffChange', s:ui.yellow, s:background_2)
call s:HL('DiffDelete', s:ui.red, s:background_2)
call s:HL('DiffText', s:ui.blue, s:background_2)
call s:HL('DiffAdded', s:ui.green, s:none)
call s:HL('DiffFile', s:ui.red, s:none)
call s:HL('DiffNewFile', s:ui.green, s:none)
call s:HL('DiffLine', s:ui.blue, s:none)
call s:HL('DiffRemoved', s:ui.red, s:none)

" }}}
" Spelling: {{{

if has("spell")
  call s:HL('SpellCap', s:none, s:none, s:italic . s:undercurl, s:ui.blue)
  call s:HL('SpellBad', s:none, s:none, s:italic . s:undercurl , s:ui.red)
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:ui.cyan)
  call s:HL('SpellRare', s:none, s:none, s:undercurl, s:ui.purple)
endif

" }}}

" Filetype Specific -----------------------------------------------------------
" Bash: {{{

" call s:HL('bashStatement', s:none, s:none, s:bold)

" }}}
" C: {{{

" call s:HL('cOperator', s:cyan0)
" call s:HL('cPreCondit', s:magenta0)

" }}}
" CMake: {{{

" call s:HL('cmakeStatement', s:red0)
" call s:HL('cmakeArguments', s:fg1)
" call s:HL('cmakeVariableValue', s:blue0)
" call s:HL('cmakeOperator', s:red0)

" }}}
" CPP: {{{

" call s:HL('cppSTLnamespace', s:magenta0)

" }}}
" CS: {{{

" call s:HL('csClass', s:yellow0)
" call s:HL('csAttribute', s:yellow0)
" call s:HL('csModifier', s:magenta0)
" call s:HL('csType', s:red0)
" call s:HL('csUnspecifiedStatement', s:blue0)
" call s:HL('csContextualStatement', s:magenta0)
" call s:HL('csNewDecleration', s:red0)

" }}}
" Fish: {{{

" call s:HL('fishStatement', s:blue0, s:none, s:bold)
" call s:HL('fishString', s:green0)
" call s:HL('fishConditional', s:magenta0)
" call s:HL('fishRepeat', s:magenta0, s:none, s:bold)

" }}}
" HTML: {{{

" call s:HL('htmlTitle', s:green0, s:none, s:bold)
" call s:HL('htmlH1', s:ui.green, s:none, s:bold)
" call s:HL('htmlH2', s:ui.blue, s:none, s:bold)
" call s:HL('htmlH3', s:ui.purple, s:none, s:bold)
" call s:HL('htmlH4', s:ui.yellow, s:none, s:bold)
" call s:HL('htmlH5', s:ui.dark_green, s:none, s:bold)
" call s:HL('htmlH6', s:ui.dark_blue, s:none, s:bold)
" call s:HL('htmlH7', s:ui.dark_purple, s:none, s:bold)
" call s:HL('htmlTag', s:fg1)
" call s:HL('htmlTagName', s:blue0, s:none, s:bold)
" call s:HL('htmlArg', s:fg1)
" call s:HL('htmlEndTag', s:fg1)
" call s:HL('htmlBold', s:none, s:none, s:bold)
" call s:HL('htmlItalic', s:none, s:none, s:italic)

" }}}
" Mail: {{{

" call s:HL('mailHeaderKey', s:blue0)
" call s:HL('mailHeaderEmail', s:magenta0)
" call s:HL('mailSubject', s:red0)
" call s:HL('mailHeader', s:fg0)
" call s:HL('mailURL', s:cyan0)
" call s:HL('mailEmail', s:magenta0)
" call s:HL('mailQuoted1', s:green0)
" call s:HL('mailQuoted2', s:blue0)

" }}}
" Makefile: {{{

" call s:HL('makeDefine', s:yellow0)
" call s:HL('makeIdent', s:fg1)
" call s:HL('makeSpecTarget', s:green0)
" call s:HL('makeTarget', s:red0)
" call s:HL('makeStatememt', s:magenta0, s:none, s:bold)
" call s:HL('makeCommands', s:blue0)
" call s:HL('makeSpecial', s:yellow0, s:none, s:bold)

" }}}
" Markdown: {{{

" call s:HL('mkdHeadingRule', s:green0, s:none, s:bold)
" call s:HL('mkdH1', s:green0, s:none, s:bold)
" call s:HL('mkdH2', s:blue0, s:none, s:bold)

" call s:HL('mkdBlockquote', s:none, s:bg1)
" call s:HL('mkdCode', s:green0)
" call s:HL('mkdCodeStart', s:red0)
" call s:HL('mkdCodeEnd', s:red0)
" call s:HL('mkdLink', s:blue0, s:none, s:underline)
" call s:HL('mkdUrl', s:magenta1)
" call s:HL('mkdDelimiter', s:yellow0)
" call s:HL('mkdDelimiter', s:yellow0)
" call s:HL('mkdRule', s:magenta0)

" }}}
" Python: {{{

" call s:HL('pythonOperator', s:magenta0)
" call s:HL('pythonRepeat', s:magenta0)
" call s:HL('pythonInclude', s:magenta0)
" call s:HL('pythonStatement', s:magenta0)

" }}}
" ReStructuredText: {{{

" call s:HL('rstSections', s:blue0, s:none, s:bold)
" call s:HL('rstDirective', s:blue0)
" call s:HL('rstHyperlinkTarget', s:green0)
" call s:HL('rstInlineLiteral', s:green1)
" call s:HL('rstInterpretedTextOrHyperLinkReference', s:blue0)

" }}}
" Shell: {{{

" call s:HL('shDerefVar', s:cyan0, s:none, s:bold)
" call s:HL('shDerefSimple', s:cyan0)
" call s:HL('shFunction', s:yellow1, s:none, s:bold)
" call s:HL('shStatement', s:none)
" call s:HL('shLoop', s:magenta0, s:none, s:bold)
" call s:HL('shQuote', s:green1)
" call s:HL('shCaseEsac', s:cyan0, s:none, s:bold)
" call s:HL('shSnglCase', s:magenta0)
" call s:HL('shFunctionOne', s:blue0)
" call s:HL('shCase', s:blue0)
" call s:HL('shSetList', s:red1)
" call s:HL('shOperator', s:cyan0)
" call s:HL('shOption', s:green1)
" call s:HL('shLine', s:none)
" call s:HL('shWrapLineOperator', s:red1)

" }}}
" Tex: {{{

" call s:HL('texStatement', s:green0)
" call s:HL('texMathZoneX', s:blue0)
" call s:HL('texMathZoneX', s:blue0)
" call s:HL('texMathMatcher', s:blue0)
" call s:HL('texRefLabel', s:green0)
" call s:HL('texBoldStyle', s:none, s:none, s:bold)
" call s:HL('texItalStyle', s:none, s:none, s:italic)

" }}}
" Vim: {{{

" call s:HL('vimCommentTitle', s:magenta1, s:none, s:bold . s:italic)
" call s:HL('vimCommentString', s:magenta1)
" call s:HL('vimCommand', s:yellow0)
" call s:HL('vimCmdSep', s:blue0, s:none, s:bold)
" call s:HL('vimIsCommand', s:fg1)
" call s:HL('vimSynMtchOpt', s:yellow0)
" call s:HL('vimSynType', s:cyan0)
" call s:HL('vimHiLink', s:blue0)
" call s:HL('vimHiGroup', s:blue0)
" call s:HL('vimGroup', s:blue0, s:none, s:bold)

" }}}
" Vim Help: {{{

" call s:HL('helpExample', s:fg1)
" call s:HL('helpOption', s:cyan0)
" call s:HL('helpNote', s:magenta0)
" call s:HL('helpVim', s:magenta0)
" call s:HL('helpHyperTextJump', s:blue0)
" call s:HL('helpHyperTextEntry', s:green0)

" }}}
" Yaml: {{{

" call s:HL('yamlBlockMappingKey', s:blue0)
" call s:HL('yamlKeyValueDelimiter', s:yellow0)
" call s:HL('yamlBlockCollectionItemStart', s:yellow0)

" }}}

" Plugin Specific: -------------------------------------------------------------
" NERDTree: {{{

call s:HL('NERDTreeExecFile', s:ui.dark_purple, s:none, s:bold)

" }}}

unlet s:ui
