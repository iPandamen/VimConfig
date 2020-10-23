


highlight clear

set background=dark

if exists("syntax_on")
    syntax reset
endif
set t_Co=256

let g:colors_name = "pants"

" set to "256" for 256-color terminals. or
" set to "16" to use your terminal emulator's native colors
if !exists("g:pants_terminal_colors")
    let g:pants_terminal_colors = 256
endif

if !exists("g:pants_terminal_italics")
    let g:pants_terminal_italics = 1
endif


function! s:h(group,style)
    if g:pants_terminal_italics == 0
        if has_key(a:style,"cterm") && a:style["cterm"] ==? "italic"     " ==?  不区分大小写
            unlet a:style.cterm
        endif
        if has_key(aLstyle,"gui") && a:style["gui"] ==? "italic"
            unlet a:style.gui
        endif
    endif

    " 判断是否是 16-colors
    if g:pants_terminal_colors == 16
        let l:ctermfg = (has_key(a:style,"fg") ? a:style.fg.cterm16 : "NONE")
        let l:ctermbg = (has_key(a:style,"bg") ? a:style.bg.cterm16 : "NONE")
    else
        let l:ctermfg = (has_key(a:style,"fg") ? a:style.fg.cterm : "NONE")
        let l:ctermbg = (has_key(a:style,"bg") ? a:style.bg.cterm : "NONE")
    endif

    execute "highlight " a:group
                \ "guifg="  (has_key(a:style,"fg")  ? a:style.fg.gui    : "NONE")
                \ "guibg="  (has_key(a:style,"bg")  ? a:style.bg.gui    : "NONE")
                \ "guisp="  (has_key(a:style,"sp")  ? a:style.sp.gui    : "NONE")
                \ "gui="    (has_key(a:style,"gui") ? a:style.gui       : "NONE")
                \ "ctermfg=" . l:ctermfg
                \ "ctermbg=" . l:ctermbg
                \ "cterm="  (has_key(a:style,"cterm")   ? a:style.cterm :"NONE") 
                \ "term="   (has_key(a:style,"term")    ? a:style.term  :"NONE")
endfunction




let s:red = {"gui":"#E06C75","cterm":"204","cterm16":"1"} " Alternate cterm: 168
let s:dark_red = {"gui":"#BE5046","cterm":"196","cterm16":"9"}

let s:green = {"gui":"#98C379","cterm":"072","cterm16":"2"}

let s:yellow = {"gui":"#E5C07B","cterm":"180","cterm16":"3"}
let s:dark_yellow = {"gui":"#D19A66","cterm":"173","cterm16":"11"}

let s:blue = {"gui":"#61AFEF","cterm":"39","cterm16":"5"} " Alternate cterm:75

let s:purple = {"gui":"#C678DD","cterm":"170","cterm16":"5"} " Alternate cterm:176

let s:cyan = {"gui":"#56B6C2","cterm":"38","cterm16":"6"} " Alternate cterm:73

let s:white = {"gui":"#ABB2BF","cterm":"145","cterm16":"7"}

let s:black = {"gui":"#282C34","cterm":"235","cterm16":"0"}
let s:visual_black = {"gui":"NONE","cterm":"NONE","cterm16":s:black.cterm16} "Black out selected text in 16-color visual mode

let s:comment_grey = {"gui":"#5c6370","cterm":"59","cterm16":"15"}
let s:gutter_fg_grey = {"gui":"#636D83","cterm":"238","cterm16":"15"}
let s:cursor_grey = {"gui":"#2C323C","cterm":"237","cterm16":"8"}
let s:visual_grey = {"gui":"#3E4452","cterm":"237","cterm16":"15"}
let s:menu_grey = {"gui":s:visual_grey.gui,"cterm":s:visual_grey.cterm,"cterm16":"8"}
let s:special_grey = {"gui":"#3B4048","cterm":"238","cterm16":"15"}
let s:vertsplit = {"gui":"#181A1F","cterm":"59","cterm16":"15"}


call s:h("Comment",{"fg":s:comment_grey,"gui":"italic","cterm":"italic"}) " any comment
call s:h("Constant",{"fg":s:cyan}) " any constant)
call s:h("String",{"fg":s:green}) " a string constant: "this is a string"
call s:h("Character",{"fg":s:green}) " a character constant: 'c','\n'
call s:h("Number",{"fg":s:dark_yellow}) " a number constant:234,0xff
call s:h("Boolean",{"fg":s:dark_yellow}) " a boolean constant: True,false
call s:h("Float",{"fg":s:dark_yellow}) "a floating point constant:2.3e10

call s:h("Identifier",{"fg":s:red}) " any variable name
call s:h("Function",{"fg":s:blue}) "function name(also: methods for classes)
call s:h("Statement",{"fg":s:purple}) " any statement
call s:h("Conditional",{"fg":s:purple}) " if, then, else, endif, switch, etc.
call s:h("Repeat",{"fg":s:purple}) " for,do,while,etc.
call s:h("Label",{"fg":s:purple}) " case, default,etc
call s:h("Operator",{"fg":s:purple}) " sizeof , + , * etc.
call s:h("Keyword",{"fg":s:red}) "any other keyword
call s:h("Exception",{"fg":s:purple}) " try, catch, throw
call s:h("Preproc",{"fg":s:yellow}) "generic Preprocessor
call s:h("Include",{"fg":s:blue}) " preprocessor #iinclude
call s:h("Define",{"fg":s:purple}) " preprocessor #define
call s:h("Macro",{"fg":s:purple}) " same as Define
call s:h("PreCondit",{"fg":s:yellow}) "preprocessor #if, #else, #endif, etc
call s:h("Type",{"fg":s:yellow}) " int, lone ,char, etc.
call s:h("StorageClass",{"fg":s:yellow}) " static, register, volatile, etc.
call s:h("Structure",{"fg":s:yellow}) " struct, union,enum,etc.
call s:h("Typedef",{"fg":s:yellow}) " a typedef
call s:h("Special",{"fg":s:blue}) " any special symbol


call s:h("SpecialChar",{}) " special character in a constant
call s:h("Tag",{}) " you can use CTRL-] on this
call s:h("Delimiter",{}) " character that needs attention
call s:h("SpecialComment",{}) "special things inside a comment
call s:h("Debug",{}) " debugging statements
call s:h("Underlined",{}) " text that stands out,HTML links
call s:h("Ignore",{}) " left blank,hidden

call s:h("Error",{"fg":s:red}) "any errorneous construct
call s:h("Todo",{"fg":s:purple}) " anything that needs extra attention: mostly the keywords TODO FIXME and XXX


call s:h("ColorColumn",{"bg":s:cursor_grey}) " used for the columns set with 'colorcolumn'
call s:h("Conceal",{}) "placeholder characters subsitituted for concealed tex (see 'conceallevel')
call s:h("Cursor",{"fg":s:black,"bg":s:blue}) " the character under the cursor
call s:h("CursorIM",{}) " like cursor,but used when in IME mode
call s:h("CursorColumn",{"bg":s:cursor_grey}) " the screen column that the cursor is in when 'cursorcolumn' is set
call s:h("CursorLine",{"bg":s:cursor_grey}) " the screen line that the cursor is in when 'cursorline' is set
call s:h("Directory",{"fg":s:blue}) " directory names (and other special names in listings)
call s:h("DiffAdd",{"fg":s:green}) " diff mode: Added line
call s:h("DiffChange",{"fg":s:dark_yellow}) " diff mode: Changed line
call s:h("DiffDelete",{"fg":s:red}) " diff mode: Deleted line
call s:h("DiffText",{"fg":s:blue}) " diff mode: Changed text within a changed line
call s:h("ErrorMsg",{}) " error messages on the command line
call s:h("VertSplit",{"fg":s:vertsplit}) " the column separating vertically split windows
call s:h("Folded",{"fg":s:comment_grey}) " line used for closed folds
call s:h("FoldColumn",{}) " 'foldcolumn'
call s:h("SignColumn",{}) " column where signs are displayed
call s:h("Incsearch",{"fg":s:black,"bg":s:yellow}) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
call s:h("LineNr",{"fg":s:gutter_fg_grey}) " Line number for ":number" and ":#" commands,and when 'number' or 'relativenumber' option is set
call s:h("CursorLineNr",{"fg":s:gutter_fg_grey}) " Like lineNr when 'cursorlinne' or 'relativenumber' is set for the cursor line
call s:h("MatchParen",{"fg":s:blue,"gui":"underline"}) " The character under the cursor or just before it, if it is a paired bracket, and its match.
call s:h("ModeMsg",{}) " 'showmode' message(e.g.,"-- INERT --")
call s:h("MoreMsg",{}) " 'more prompt
call s:h("NonText",{"fg":s:special_grey}) " '~' and '@' at the end of the window , characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the line)
call s:h("Normal",{"fg":s:white,"bg":s:black}) " normal text
call s:h("Pmenu",{"bg":s:menu_grey}) " Popup menu: normal item.
call s:h("PmenuSel",{"bg":s:black}) " Popup menu: selected item. 
call s:h("PmenuSbar",{"bg":s:special_grey}) " Popup menu: scrollbar.
call s:h("PmenuThumb",{"bg":s:white}) " Popup menu: Thumb of the scrollbar
call s:h("Question",{"fg":s:purple}) " hit-enter prompt and yes/no questions
call s:h("Search",{"fg":s:black,"bg":s:yellow}) " last search pattern highlight (see 'hlsearch'). Also used for highlighting the cuurrent line in the quickfix window and similar items that need to stand out.
call s:h("SpecialKey",{"fg":s:special_grey}) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:h("SpellBad",{"fg":s:red,"gui":"underline","cterm":"underline"}) " word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise
call s:h("SpellCap",{"fg":s:dark_yellow}) " word that should start with a captial. this will be combined with the highlighting used otherwise
call s:h("SpellLocal",{"fg":s:dark_yellow}) " word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise
call s:h("SpellRare",{"fg":s:dark_yellow}) " word that si recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:h("StatusLine",{"fg":s:white,"bg":s:cursor_grey}) " status line of current window
call s:h("statusLineNr",{"fg":s:comment_grey}) " status lines of not-current windows Note: if this is equal to "statusLine" vim will use "^^^" in the status line of the current window 

call s:h("TabLine",{"fg":s:comment_grey}) " tab pages line, not active tab page label.
call s:h("TabLineFill",{}) " tab pages line. where there are no labels
call s:h("TabLineSel",{"fg":s:white}) " tab pages line, active tab page label
call s:h("Title",{"fg":s:green}) " title for output from ":set all", ":autocmd" etc.
call s:h("Visual",{"fg":s:visual_black,"bg":s:visual_grey}) " Visual mode selection
call s:h("VisualNOS",{"bg":s:visual_grey}) " Visual mode selection when vim is Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:h("WarningMsg",{"fg":s:red}) " warning messages
call s:h("WildMenu",{}) " current match in 'wildmenu' completion






