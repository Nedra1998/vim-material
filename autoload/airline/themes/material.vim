" vim-airline template by chartoin (http://github.com/chartoin)
" Base 16 Flat Scheme by Chris Kempson (http://chriskempson.com)
let g:airline#themes#material#palette = {}
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
let s:ui.red               = ['#FF5370', 210]
let s:ui.dark_red          = ['#E53935', 167]
let s:ui.pink              = ['#F07178', 210]
let s:ui.dark_pink         = ['#FF5370', 210]
let s:ui.orange            = ['#F78C6C', 216]
let s:ui.dark_orange       = ['#F76D47', 209]
let s:ui.yellow            = ['#FFCB6B', 222]
let s:ui.dark_yellow       = ['#FFB62C', 221]
let s:ui.green             = ['#C3E88D', 193]
let s:ui.dark_green        = ['#91B859', 150]
let s:ui.pale_blue         = ['#B2CCD6', 152]
let s:ui.dark_pale_blue    = ['#8796B0', 145]
let s:ui.cyan              = ['#89DDFF', 153]
let s:ui.dark_cyan         = ['#39ADB5', 074]
let s:ui.blue              = ['#28AAFF', 075]
let s:ui.dark_blue         = ['#6182B8', 110]
let s:ui.purple            = ['#C792EA', 183]
let s:ui.dark_purple       = ['#7C4DFF', 105]
let s:ui.violet            = ['#C792EA', 183]
let s:ui.dark_violet       = ['#945EB8', 140]
let s:ui.brown             = ['#AB7967', 138]
let s:ui.dark_brown        = ['#AB7967', 138]

let s:N1   = [ s:ui.white[0], g:primary[0], s:ui.white[1], g:primary[1] ]
let s:N2   = [ s:ui.very_light_gray[0], s:ui.very_dark_gray[0], s:ui.red[1], s:ui.blue[1] ]
let s:N3   = [ s:ui.lighter_gray[0], s:ui.darker_gray[0], s:ui.red[1], s:ui.blue[1] ]
let g:airline#themes#material#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1   = [ s:ui.white[0], s:ui.blue[0], s:ui.red[1], s:ui.blue[1] ]
let s:I2   = [ s:ui.very_light_gray[0], s:ui.very_dark_gray[0], s:ui.red[1], s:ui.blue[1] ]
let s:I3   = [ s:ui.lighter_gray[0], s:ui.darker_gray[0], s:ui.red[1], s:ui.blue[1] ]
let g:airline#themes#material#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:R1   = [ s:ui.white[0], s:ui.dark_red[0], s:ui.red[1], s:ui.blue[1] ]
let s:R2   = [ s:ui.very_light_gray[0], s:ui.very_dark_gray[0], s:ui.red[1], s:ui.blue[1] ]
let s:R3   = [ s:ui.lighter_gray[0], s:ui.darker_gray[0], s:ui.red[1], s:ui.blue[1] ]
let g:airline#themes#material#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:V1   = [ s:ui.white[0], s:ui.dark_purple[0], s:ui.red[1], s:ui.blue[1] ]
let s:V2   = [ s:ui.very_light_gray[0], s:ui.very_dark_gray[0], s:ui.red[1], s:ui.blue[1] ]
let s:V3   = [ s:ui.lighter_gray[0], s:ui.darker_gray[0], s:ui.red[1], s:ui.blue[1] ]
let g:airline#themes#material#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:IA1   = [ s:ui.white[0], s:ui.dark_gray[0], s:ui.white[1], s:ui.blue[1] ]
let s:IA2   = [ s:ui.very_light_gray[0], s:ui.very_dark_gray[0], s:ui.red[1], s:ui.blue[1] ]
let s:IA3   = [ s:ui.lighter_gray[0], s:ui.darker_gray[0], s:ui.red[1], s:ui.blue[1] ]
let g:airline#themes#material#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
"if !get(g:, 'loaded_ctrlp', 0)
"  finish
"endif
"let g:airline#themes#material#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
"      \ [ s:gui07, s:gui02, s:cterm07, s:cterm02, '' ],
"      \ [ s:gui07, s:gui04, s:cterm07, s:cterm04, '' ],
"      \ [ s:gui05, s:gui01, s:cterm05, s:cterm01, 'bold' ])
